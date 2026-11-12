'use strict';
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { setup, endpoint, traceId, proxyUrl, googleUrl } = require('./harness.cjs');

const ENVELOPE_KEYS = ['trace_id', 'platform', 'tag_name', 'event_name', 'event_type',
  'request_method', 'request_url', 'request_body', 'response_status', 'response_body', 'duration_ms'];

// Os dois pontos de entrega do template: proxy da Wascer (API de callback) e Google direto (promise).
const FLOWS = [
  { flow: 'waster', url: proxyUrl, api: 'callback' },
  { flow: 'own', url: googleUrl, api: 'promise' }
];

function run(flow, options = {}) {
  return setup({ ...options, data: { authFlow: flow, ...options.data } });
}

for (const { flow, url, api } of FLOWS) {
  test(flow + ': sem x-wascer-log, uma chamada só (vendor), nenhuma ao coletor', async () => {
    const s = run(flow, { headers: { 'x-wascer-log': undefined } });
    await s.settle();
    assert.equal(s.calls.length, 1);
    assert.equal(s.calls[0].url, url);
    assert.equal(s.calls[0].api, api);
    assert.equal(s.logs.length, 0);
    assert.equal(s.success, 1);
    assert.equal(s.failure, 0);
  });

  for (const flag of ['0', 'true', '1 ', '01', '', 1, true]) {
    test(flow + ': x-wascer-log = ' + JSON.stringify(flag) + ', nenhuma chamada ao coletor', async () => {
      const s = run(flow, { headers: { 'x-wascer-log': flag } });
      await s.settle();
      assert.equal(s.calls.length, 1);
      assert.equal(s.logs.length, 0);
      assert.equal(s.success, 1);
    });
  }

  test(flow + ': x-wascer-log = "1" e vendor 200, uma cópia com o envelope exato', async () => {
    const s = run(flow, { vendorPending: true });
    assert.equal(s.calls.length, 1, 'só o vendor antes da resposta');
    assert.equal(s.logs.length, 0, 'nada é copiado antes de o vendor responder');
    s.completeVendor();
    await s.settle();
    assert.equal(s.calls.length, 2);
    assert.equal(s.logs.length, 1);
    const [vendor, collector] = s.calls;
    const row = s.logs[0];
    assert.equal(collector.url, endpoint);
    assert.equal(collector.options.method, 'POST');
    assert.deepEqual(Object.keys(row).sort(), ENVELOPE_KEYS.slice().sort());
    assert.equal(row.trace_id, traceId);
    assert.equal(row.platform, 'google_data_manager');
    assert.equal(row.tag_name, 'Google Data Manager');
    assert.equal(row.event_name, 'purchase');
    assert.equal(row.event_type, 'purchase');
    assert.equal(row.request_method, 'POST');
    assert.equal(row.request_url, vendor.url);
    assert.equal(row.request_url, url, 'a URL que a tag de fato usou');
    assert.equal(typeof vendor.body, 'string');
    assert.equal(row.request_body, vendor.body, 'string idêntica, byte a byte');
    assert.equal(row.response_status, 200);
    assert.equal(row.response_body, '{"ok":true}\n');
    assert.ok(Number.isInteger(row.duration_ms) && row.duration_ms >= 0);
    assert.equal(row.duration_ms, 37);
    assert.ok(!JSON.stringify(row).includes('response-credential-never-copy'), 'headers da resposta não vão');
    assert.ok(!JSON.stringify(row).includes('owner-1'), 'headers do request não vão');
    assert.equal(s.success, 1);
    assert.equal(s.failure, 0);
  });

  for (const status of [400, 503]) {
    test(flow + ': vendor ' + status + ', cópia com o status e o body; a tag chama gtmOnFailure', async () => {
      const s = run(flow, { status, responseBody: '{"error":"nope"}' });
      await s.settle();
      assert.equal(s.logs.length, 1);
      assert.equal(s.logs[0].response_status, status);
      assert.equal(s.logs[0].response_body, '{"error":"nope"}');
      assert.equal(s.failure, 1);
      assert.equal(s.success, 0);
    });
  }

  test(flow + ': erro de rede no vendor, uma cópia com response_status 0', async () => {
    const s = run(flow, { vendorError: { reason: 'timed_out' } });
    await s.settle();
    assert.equal(s.logs.length, 1);
    assert.equal(s.logs[0].response_status, 0);
    assert.equal(s.logs[0].request_url, url);
    assert.equal(s.logs[0].request_body, s.calls[0].body);
    assert.equal(s.success, 0);
  });

  test(flow + ': campo "Event type (System Log)" preenchido vai em event_type; vazio usa event_name', async () => {
    const filled = run(flow, { data: { systemLogEventType: 'compra-site' } });
    await filled.settle();
    assert.equal(filled.logs[0].event_type, 'compra-site');
    assert.equal(filled.logs[0].event_name, 'purchase');
    const empty = run(flow, { data: { systemLogEventType: '' } });
    await empty.settle();
    assert.equal(empty.logs[0].event_type, 'purchase');
  });

  for (const [label, extra] of [['ausente', {}], ['não-string', { event_name: 42 }]]) {
    test(flow + ': event_name ' + label + ', event_name e event_type vão como string vazia', async () => {
      const s = run(flow, { event: { value: 10, ...extra } });
      await s.settle();
      assert.equal(s.logs[0].event_name, '');
      assert.equal(s.logs[0].event_type, '');
      assert.equal(s.success, 1);
    });
  }

  for (const mode of ['reject', 'throw', 'pending']) {
    test(flow + ': coletor ' + mode + ', resultado da tag e chamada ao vendor idênticos ao caso sem cópia', async () => {
      for (const outcome of [{ status: 200 }, { status: 503 }, { vendorError: { reason: 'failed' } }]) {
        const off = run(flow, { headers: { 'x-wascer-log': undefined }, ...outcome });
        await off.settle();
        const on = run(flow, { collectorMode: mode, ...outcome });
        await on.settle();
        assert.equal(on.logs.length, 1);
        assert.equal(on.success, off.success);
        assert.equal(on.failure, off.failure);
        assert.equal(on.unhandledVendorRejections, off.unhandledVendorRejections);
        assert.deepEqual(on.calls.filter(c => c.url !== endpoint), off.calls);
      }
    });
  }

  test(flow + ': x-wascer-log = "1" sem x-wascer-trace-id, a tag termina normalmente', async () => {
    const s = run(flow, { headers: { 'x-wascer-trace-id': undefined } });
    await s.settle();
    assert.equal(s.success, 1);
    assert.equal(s.failure, 0);
    assert.equal(s.logs[0].trace_id, '');
  });

  test(flow + ': a cópia usa timeout de 500 ms e Content-Type application/json', async () => {
    const s = run(flow);
    await s.settle();
    const collector = s.calls[1];
    assert.equal(collector.options.timeout, 500);
    assert.deepEqual(collector.options.headers, { 'Content-Type': 'application/json' });
  });

  test(flow + ': BigQuery e console ligados não geram cópia a mais nem chamada HTTP a mais', async () => {
    const s = run(flow, { data: { bigQueryLogType: 'always', logType: 'always' } });
    await s.settle();
    assert.equal(s.bigQueryRows.length, 2, 'request e response continuam indo para o BigQuery');
    assert.equal(s.consoleLogs.length, 2);
    assert.equal(s.calls.length, 2, 'vendor + uma cópia');
    assert.equal(s.logs.length, 1);
    assert.equal(s.logs[0].request_url, url);
  });

  test(flow + ': saídas antecipadas (consentimento negado, preview gtm-msr) não chamam vendor nem coletor', async () => {
    const denied = run(flow, {
      data: { adStorageConsent: 'required' },
      event: { event_name: 'purchase', consent_state: { ad_storage: false } }
    });
    const preview = run(flow, {
      event: { event_name: 'purchase', page_location: 'https://gtm-msr.appspot.com/render' }
    });
    await Promise.all([denied.settle(), preview.settle()]);
    for (const s of [denied, preview]) {
      assert.equal(s.calls.length, 0);
      assert.equal(s.logs.length, 0);
      assert.equal(s.success, 1);
    }
  });

  test(flow + ': com a cópia desligada, a chamada ao vendor é idêntica à do template da main', async () => {
    // fixture = seção SANDBOXED_JS_FOR_SERVER de `git show origin/main:template.tpl` antes desta mudança
    const mainCode = fs.readFileSync(path.resolve(__dirname, 'fixtures/sandboxed-js.main.txt'), 'utf8');
    const variants = [
      {},
      { data: { validateOnly: true, gclid: 'gclid-1', email: 'Other@Example.Test', firstName: 'Ana', ipAddress: '203.0.113.9' } },
      { data: { bigQueryLogType: 'always', logType: 'always' } },
      { status: 500 },
      { vendorError: { reason: 'timed_out' } },
      { event: {} }
    ];
    for (const variant of variants) {
      const noLog = { headers: { 'x-wascer-log': undefined } };
      const before = run(flow, { ...variant, ...noLog, code: mainCode });
      const after = run(flow, { ...variant, ...noLog });
      const withLog = run(flow, variant);
      await Promise.all([before.settle(), after.settle(), withLog.settle()]);
      assert.equal(before.calls.length, 1);
      assert.deepEqual(after.calls, before.calls);
      assert.deepEqual(withLog.calls[0], before.calls[0], 'ligar o log não muda a chamada ao vendor');
      for (const s of [after, withLog]) {
        assert.equal(s.success, before.success);
        assert.equal(s.failure, before.failure);
        assert.equal(s.unhandledVendorRejections, before.unhandledVendorRejections);
        assert.deepEqual(s.bigQueryRows, before.bigQueryRows);
        assert.deepEqual(s.consoleLogs, before.consoleLogs);
        assert.deepEqual(s.authCalls, before.authCalls);
      }
    }
  });
}

test('waster: erro de rede chega pelo callback sem status; a cópia vai com 0 e body vazio, e a tag falha', async () => {
  const s = run('waster', { vendorError: { reason: 'timed_out' } });
  await s.settle();
  assert.equal(s.logs[0].response_status, 0);
  assert.equal(s.logs[0].response_body, '');
  assert.equal(s.failure, 1);
});

test('own: erro de rede copia error.reason, ou error.body quando houver', async () => {
  const reason = run('own', { vendorError: { reason: 'timed_out' } });
  const body = run('own', { vendorError: { reason: 'failed', body: 'raw error body' } });
  await Promise.all([reason.settle(), body.settle()]);
  assert.equal(reason.logs[0].response_body, 'timed_out');
  assert.equal(body.logs[0].response_body, 'raw error body');
});

test('own: erro de rede continua sem gtmOnSuccess/gtmOnFailure, como na main', async () => {
  const s = run('own', { vendorError: { reason: 'timed_out' } });
  await s.settle();
  assert.equal(s.success, 0);
  assert.equal(s.failure, 0);
  assert.equal(s.unhandledVendorRejections, 1);
});

test('own: getGoogleAuth é chamado uma vez e não vira chamada HTTP nem cópia', async () => {
  const s = run('own');
  await s.settle();
  assert.equal(s.authCalls.length, 1);
  assert.deepEqual(s.calls[0].options.authorization, { googleAuth: 'double' });
  assert.equal(s.logs.length, 1);
  assert.ok(!s.logs[0].request_body.includes('googleAuth'));
});

test('waster copia o corpo cru enviado ao proxy; own copia o corpo já com hash', async () => {
  const waster = run('waster');
  const own = run('own');
  await Promise.all([waster.settle(), own.settle()]);
  assert.ok(waster.logs[0].request_body.includes('private@example.test'), 'sem máscara');
  assert.ok(!own.logs[0].request_body.includes('private@example.test'));
  assert.equal(JSON.parse(own.logs[0].request_body).encoding, 'HEX');
});

test('campo systemLogEventType: TEXT, no fim do grupo Logging', () => {
  const s = setup();
  const group = s.parameters[s.parameters.length - 1];
  assert.equal(group.name, 'loggingGroup');
  const field = group.subParams[group.subParams.length - 1];
  assert.equal(field.name, 'systemLogEventType');
  assert.equal(field.type, 'TEXT');
  assert.equal(field.displayName, 'Event type (System Log)');
  assert.equal(field.simpleValueType, true);
  assert.notEqual(s.parameters[0].name, 'systemLogEventType');
});

test('permissões: read_request ganha só os dois headers; as demais ficam como na main', () => {
  const s = setup();
  const names = s.permission('read_request').headerWhitelist.listItem.map(p => p.mapValue[0].string);
  assert.deepEqual(names, ['trace-id', 'referer', 'x-user-id', 'user-agent', 'x-wascer-log', 'x-wascer-trace-id']);
  assert.equal(s.permission('read_request').headerAccess.string, 'specific');
  assert.equal(s.permission('send_http').allowedUrls.string, 'any');
  assert.equal(s.permission('read_event_data').eventDataAccess.string, 'any');
  assert.deepEqual(s.permissions.map(p => p.instance.key.publicId), ['logging', 'send_http',
    'read_event_data', 'read_request', 'read_container_data', 'use_google_credentials', 'access_bigquery']);
});
