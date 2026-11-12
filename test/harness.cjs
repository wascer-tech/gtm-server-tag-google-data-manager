'use strict';
// Runs the sandboxed server code of template.tpl in node:vm with permission-aware
// API doubles. Not a Google sandbox compiler and not proof of live sGTM delivery.
const assert = require('node:assert/strict');
const crypto = require('node:crypto');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const endpoint = 'https://system-log.wascer.internal/log';
const traceId = '12345678-1234-4234-8234-123456789abc';
const proxyUrl = 'https://waster.sourei.com.br/google-conversions/events';
const googleUrl = 'https://datamanager.googleapis.com/v1/events:ingest';
const templatePath = path.resolve(__dirname, '../template.tpl');

function section(text, name) {
  return text.split('___' + name + '___')[1].split(/___[A-Z_]+___/)[0].trim();
}

function readTemplate() {
  const text = fs.readFileSync(templatePath, 'utf8');
  return {
    info: JSON.parse(section(text, 'INFO')),
    parameters: JSON.parse(section(text, 'TEMPLATE_PARAMETERS')),
    permissions: JSON.parse(section(text, 'SERVER_PERMISSIONS')),
    code: section(text, 'SANDBOXED_JS_FOR_SERVER')
  };
}

const safeJSON = {
  stringify: JSON.stringify,
  parse(value) { try { return JSON.parse(value); } catch (e) { return undefined; } }
};

// options.code runs another program (e.g. the fixture from main) against the same doubles.
// options.data.authFlow picks the delivery path: 'waster' (proxy, default) or 'own' (Google).
function setup(options = {}) {
  const template = readTemplate();
  const permissions = template.permissions;
  function permission(name) {
    const entry = permissions.find(p => p.instance.key.publicId === name);
    assert.ok(entry, 'template lacks permission ' + name);
    return Object.fromEntries(entry.instance.param.map(p => [p.key, p.value]));
  }
  const calls = [], logs = [], consoleLogs = [], bigQueryRows = [], authCalls = [];
  let success = 0, failure = 0, unhandledVendorRejections = 0, completeVendor;
  let now = 1700000000000;
  const event = options.event || {
    event_name: 'purchase', value: 42, currency: 'BRL', transaction_id: 'order-1',
    email: 'private@example.test', phone: '11999990000',
    items: [{ item_id: 'sku-1', price: 21, quantity: 2, item_name: 'Plano' }]
  };
  const headers = {
    'x-wascer-log': '1', 'x-wascer-trace-id': traceId,
    'x-user-id': 'owner-1', 'user-agent': 'UA/1.0', 'trace-id': 'gtm-trace',
    ...options.headers
  };
  const data = {
    authFlow: 'waster', destinationAccountId: '123-456-7890', productDestinationId: '987',
    eventSource: 'WEB', adStorageConsent: 'optional', logType: 'no', bigQueryLogType: 'no',
    ...options.data,
    gtmOnSuccess() { success++; }, gtmOnFailure() { failure++; }
  };
  function vendorResult() {
    return {
      statusCode: options.status === undefined ? 200 : options.status,
      body: options.responseBody === undefined ? '{"ok":true}\n' : options.responseBody,
      headers: { authorization: 'response-credential-never-copy' }
    };
  }
  // Accepts both documented shapes: (url, options, body) -> promise and the legacy
  // (url, callback, options, body), whose callback also runs on network error/timeout.
  function sendHttpRequest(url, second, third, fourth) {
    assert.equal(permission('send_http').allowedUrls.string, 'any', 'send_http denied ' + url);
    const legacy = typeof second === 'function';
    const httpOptions = legacy ? third : second;
    const body = legacy ? fourth : third;
    assert.equal(typeof httpOptions, 'object');
    // clone: objetos do vm têm outro prototype
    calls.push({ api: legacy ? 'callback' : 'promise', url, options: structuredClone(httpOptions), body });
    if (url === endpoint) {
      assert.ok(!legacy, 'collector uses the promise API');
      logs.push(JSON.parse(body));
      if (options.collectorMode === 'throw') throw new Error('collector synchronous error');
      if (options.collectorMode === 'pending') return new Promise(() => {});
      if (options.collectorMode === 'reject') return Promise.reject({ reason: 'failed' });
      return Promise.resolve({ statusCode: 202, body: '' });
    }
    if (legacy) {
      completeVendor = () => {
        now += 37;
        if (options.vendorError) return second(undefined, undefined, undefined);
        const r = vendorResult();
        second(r.statusCode, r.headers, r.body);
      };
      if (!options.vendorPending) queueMicrotask(completeVendor);
      return undefined;
    }
    const promise = new Promise((resolve, reject) => {
      completeVendor = () => {
        now += 37;
        if (options.vendorError) reject(options.vendorError);
        else resolve(vendorResult());
      };
      if (!options.vendorPending) completeVendor();
    });
    // A chain without a rejection handler would end as an unhandled rejection in the
    // container. Count it here instead of letting it reach the node process.
    return {
      then(onOk, onFail) {
        if (typeof onFail === 'function') return promise.then(onOk, onFail);
        return promise.then(onOk, () => { unhandledVendorRejections++; });
      },
      catch(onFail) { return promise.catch(onFail); }
    };
  }
  function readEvent() {
    assert.equal(permission('read_event_data').eventDataAccess.string, 'any');
  }
  const apis = {
    JSON: safeJSON,
    Math,
    Promise: { create: fn => new Promise(fn), all: Promise.all.bind(Promise) },
    sendHttpRequest,
    getRequestHeader(key) {
      const scope = permission('read_request');
      assert.ok(scope.headerAccess.string === 'any' ||
        scope.headerWhitelist.listItem.some(p => p.mapValue.some(v => v.string === key)),
        'read_request denied ' + key);
      return headers[key];
    },
    getAllEventData() { readEvent(); return structuredClone(event); },
    getEventData(key) { readEvent(); return event[key]; },
    getTimestampMillis: () => now,
    getType: value => value === null ? 'null' : Array.isArray(value) ? 'array' : typeof value,
    getContainerVersion: () => ({ debugMode: false, previewMode: false }),
    makeString: value => String(value),
    makeNumber: value => Number(value),
    makeInteger: value => Math.trunc(Number(value)),
    sha256Sync: (value, opts) => crypto.createHash('sha256').update(value)
      .digest(opts && opts.outputEncoding === 'hex' ? 'hex' : 'base64'),
    encodeUriComponent: encodeURIComponent,
    getGoogleAuth(opts) { authCalls.push(structuredClone(opts)); return { googleAuth: 'double' }; },
    BigQuery: { insert(connection, rows) { bigQueryRows.push(...structuredClone(rows)); } },
    logToConsole: (...args) => consoleLogs.push(args)
  };
  const context = vm.createContext({
    data,
    require(name) { assert.ok(name in apis, 'unexpected sandbox API: ' + name); return apis[name]; }
  });
  const code = options.code === undefined ? template.code : options.code;
  new vm.Script('(function(){\n' + code + '\n})()').runInContext(context, { timeout: 1000 });
  return {
    calls, logs, consoleLogs, bigQueryRows, authCalls, data, info: template.info,
    parameters: template.parameters, permissions, permission,
    get success() { return success; }, get failure() { return failure; },
    get unhandledVendorRejections() { return unhandledVendorRejections; },
    completeVendor: () => completeVendor(),
    async settle() { for (let i = 0; i < 20; i++) await Promise.resolve(); }
  };
}

module.exports = { setup, readTemplate, endpoint, traceId, proxyUrl, googleUrl };
