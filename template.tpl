___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "displayName": "Google Data Manager - Waster",
  "description": "Send offline conversion events to Google Data Manager API via Waster proxy or your own credentials.",
  "containerContexts": [
    "SERVER"
  ],
  "securityGroups": []
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "authFlow",
    "displayName": "Authentication Flow",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "waster",
        "displayValue": "Waster Proxy"
      },
      {
        "value": "own",
        "displayValue": "Own Credentials"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "waster",
    "help": "Choose whether to use Waster proxy or your own Google credentials."
  },
  {
    "type": "TEXT",
    "name": "destinationAccountId",
    "displayName": "Google Ads Account ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Your Google Ads account ID without dashes (e.g., 1234567890)."
  },
  {
    "type": "TEXT",
    "name": "productDestinationId",
    "displayName": "Conversion Action ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "The conversion action to send events to (e.g., conversions/123456789). Find it in Google Ads > Goals > Conversions."
  },
  {
    "type": "GROUP",
    "name": "eventSettings",
    "displayName": "Event Settings",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SELECT",
        "name": "eventSource",
        "displayName": "Event Source",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "OTHER",
            "displayValue": "Other"
          },
          {
            "value": "WEB",
            "displayValue": "Web"
          },
          {
            "value": "APP",
            "displayValue": "App"
          },
          {
            "value": "PHONE",
            "displayValue": "Phone"
          },
          {
            "value": "IN_STORE",
            "displayValue": "In Store"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "OTHER"
      },
      {
        "type": "TEXT",
        "name": "conversionValue",
        "displayName": "Conversion Value",
        "simpleValueType": true,
        "help": "Optional. The value of the conversion. If empty, auto-mapped from eventData."
      },
      {
        "type": "TEXT",
        "name": "currencyCode",
        "displayName": "Currency Code",
        "simpleValueType": true,
        "help": "ISO 4217 currency code (e.g., BRL, USD). Defaults to BRL."
      },
      {
        "type": "TEXT",
        "name": "transactionId",
        "displayName": "Transaction ID",
        "simpleValueType": true,
        "help": "Optional. Unique transaction ID. Auto-mapped from eventData if empty."
      },
      {
        "type": "TEXT",
        "name": "eventTimestamp",
        "displayName": "Event Timestamp",
        "simpleValueType": true,
        "help": "Optional. ISO 8601 format. Defaults to current time."
      },
      {
        "type": "CHECKBOX",
        "name": "validateOnly",
        "checkboxText": "Validate Only (do not send to Google)",
        "simpleValueType": true,
        "help": "If checked, the event will be validated but not sent to Google."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "attributionGroup",
    "displayName": "Click Attribution",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "gclid",
        "displayName": "GCLID",
        "simpleValueType": true,
        "help": "Google Click ID. Auto-mapped from eventData if empty."
      },
      {
        "type": "TEXT",
        "name": "gbraid",
        "displayName": "GBRAID",
        "simpleValueType": true,
        "help": "Google Click ID for app conversions on iOS."
      },
      {
        "type": "TEXT",
        "name": "wbraid",
        "displayName": "WBRAID",
        "simpleValueType": true,
        "help": "Google Click ID for web conversions on iOS."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "userDataGroup",
    "displayName": "User Data",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "email",
        "displayName": "Email",
        "simpleValueType": true,
        "help": "User email. Will be hashed server-side. Auto-mapped from eventData if empty."
      },
      {
        "type": "TEXT",
        "name": "phoneNumber",
        "displayName": "Phone Number",
        "simpleValueType": true,
        "help": "Phone number in E.164 format. Will be hashed server-side. Auto-mapped from eventData if empty."
      },
      {
        "type": "TEXT",
        "name": "firstName",
        "displayName": "First Name",
        "simpleValueType": true,
        "help": "Will be hashed server-side."
      },
      {
        "type": "TEXT",
        "name": "lastName",
        "displayName": "Last Name",
        "simpleValueType": true,
        "help": "Will be hashed server-side."
      },
      {
        "type": "TEXT",
        "name": "streetAddress",
        "displayName": "Street Address",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "city",
        "displayName": "City",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "regionCode",
        "displayName": "Region Code",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "postalCode",
        "displayName": "Postal Code",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "countryCode",
        "displayName": "Country Code",
        "simpleValueType": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "consentGroup",
    "displayName": "Consent Settings",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "SELECT",
        "name": "adStorageConsent",
        "displayName": "Ad Storage Consent",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "notRequired",
            "displayValue": "Not Required"
          },
          {
            "value": "required",
            "displayValue": "Required"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "notRequired"
      },
      {
        "type": "SELECT",
        "name": "adUserData",
        "displayName": "Ad User Data",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "",
            "displayValue": "Not Set"
          },
          {
            "value": "GRANTED",
            "displayValue": "Granted"
          },
          {
            "value": "DENIED",
            "displayValue": "Denied"
          }
        ],
        "simpleValueType": true
      },
      {
        "type": "SELECT",
        "name": "adPersonalization",
        "displayName": "Ad Personalization",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "",
            "displayValue": "Not Set"
          },
          {
            "value": "GRANTED",
            "displayValue": "Granted"
          },
          {
            "value": "DENIED",
            "displayValue": "Denied"
          }
        ],
        "simpleValueType": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "extraGroup",
    "displayName": "Extra Fields",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "userAgent",
        "displayName": "User Agent",
        "simpleValueType": true,
        "help": "Optional. Auto-mapped from request header if empty."
      },
      {
        "type": "TEXT",
        "name": "ipAddress",
        "displayName": "IP Address",
        "simpleValueType": true,
        "help": "Optional. Auto-mapped from request if empty."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "loggingGroup",
    "displayName": "Logging",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "SELECT",
        "name": "logType",
        "displayName": "Console Logging",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "debug",
            "displayValue": "Debug Mode Only"
          },
          {
            "value": "always",
            "displayValue": "Always"
          },
          {
            "value": "no",
            "displayValue": "Never"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "debug"
      },
      {
        "type": "SELECT",
        "name": "bigQueryLogType",
        "displayName": "BigQuery Logging",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "no",
            "displayValue": "Disabled"
          },
          {
            "value": "always",
            "displayValue": "Always"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "no"
      },
      {
        "type": "TEXT",
        "name": "logBigQueryProjectId",
        "displayName": "BigQuery Project ID",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "bigQueryLogType",
            "paramValue": "always",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "logBigQueryDatasetId",
        "displayName": "BigQuery Dataset ID",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "bigQueryLogType",
            "paramValue": "always",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "logBigQueryTableId",
        "displayName": "BigQuery Table ID",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "bigQueryLogType",
            "paramValue": "always",
            "type": "EQUALS"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const JSON = require('JSON');
const sendHttpRequest = require('sendHttpRequest');
const getContainerVersion = require('getContainerVersion');
const logToConsole = require('logToConsole');
const getRequestHeader = require('getRequestHeader');
const getAllEventData = require('getAllEventData');
const makeString = require('makeString');
const makeNumber = require('makeNumber');
const makeInteger = require('makeInteger');
const getTimestampMillis = require('getTimestampMillis');
const getType = require('getType');
const sha256Sync = require('sha256Sync');
const Math = require('Math');
const encodeUriComponent = require('encodeUriComponent');
const getGoogleAuth = require('getGoogleAuth');
const BigQuery = require('BigQuery');

/**********************************************************************************************/

const traceId = getRequestHeader('trace-id');
const eventData = getAllEventData();

if (!isConsentGivenOrNotRequired()) {
  return data.gtmOnSuccess();
}

const url = eventData.page_location || getRequestHeader('referer');
if (url && url.lastIndexOf('https://gtm-msr.appspot.com/', 0) === 0) {
  return data.gtmOnSuccess();
}

const postBody = buildPayload();
const postUrl = getUrl();

if (data.authFlow === 'waster') {
  return sendViaWasterProxy();
} else {
  return sendViaOwnCredentials();
}

/**********************************************************************************************/
// Request handlers

function sendViaWasterProxy() {
  log({
    Name: 'GDataManager',
    Type: 'Request',
    TraceId: traceId,
    EventName: 'data_manager_conversion',
    RequestMethod: 'POST',
    RequestUrl: postUrl,
    RequestBody: postBody
  });

  sendHttpRequest(
    postUrl,
    (statusCode, headers, body) => {
      log({
        Name: 'GDataManager',
        Type: 'Response',
        TraceId: traceId,
        EventName: 'data_manager_conversion',
        ResponseStatusCode: statusCode,
        ResponseHeaders: headers,
        ResponseBody: body
      });

      if (statusCode >= 200 && statusCode < 400) {
        data.gtmOnSuccess();
      } else {
        data.gtmOnFailure();
      }
    },
    {
      headers: {
        'Content-Type': 'application/json',
        'x-user-id': enc(getRequestHeader('x-user-id')),
        'x-destination-account-id': enc(makeString(data.destinationAccountId))
      },
      method: 'POST'
    },
    JSON.stringify(postBody)
  );
}

function sendViaOwnCredentials() {
  var auth = getGoogleAuth({
    scopes: ['https://www.googleapis.com/auth/adwords']
  });

  var googlePayload = buildGooglePayload();

  log({
    Name: 'GDataManager',
    Type: 'Request',
    TraceId: traceId,
    EventName: 'data_manager_conversion',
    RequestMethod: 'POST',
    RequestUrl: postUrl,
    RequestBody: googlePayload
  });

  sendHttpRequest(
    postUrl,
    {
      headers: {
        'Content-Type': 'application/json'
      },
      method: 'POST',
      authorization: auth
    },
    JSON.stringify(googlePayload)
  ).then((result) => {
    log({
      Name: 'GDataManager',
      Type: 'Response',
      TraceId: traceId,
      EventName: 'data_manager_conversion',
      ResponseStatusCode: result.statusCode,
      ResponseHeaders: result.headers,
      ResponseBody: result.body
    });

    if (result.statusCode >= 200 && result.statusCode < 400) {
      data.gtmOnSuccess();
    } else {
      data.gtmOnFailure();
    }
  });
}

/**********************************************************************************************/
// URL builder

function getUrl() {
  if (data.authFlow === 'own') {
    return 'https://datamanager.googleapis.com/v1/events:ingest';
  }
  return 'https://waster.sourei.com.br/google-conversions/events';
}

/**********************************************************************************************/
// Payload builder — matches SendConversionEventDto

function buildPayload() {
  var payload = {};

  // transactionId
  payload.transactionId = getFieldValue(
    data.transactionId,
    eventData.transaction_id,
    eventData.orderId,
    eventData.order_id
  );
  if (!payload.transactionId) {
    payload.transactionId = 'txn_' + getTimestampMillis();
  }

  // eventTimestamp (ISO 8601)
  if (data.eventTimestamp) {
    payload.eventTimestamp = data.eventTimestamp;
  } else {
    payload.eventTimestamp = convertTimestampToISO(getTimestampMillis());
  }

  // conversionValue
  if (data.conversionValue) {
    payload.conversionValue = makeNumber(data.conversionValue);
  } else if (eventData.value) {
    payload.conversionValue = makeNumber(eventData.value);
  } else if (eventData.conversionValue) {
    payload.conversionValue = makeNumber(eventData.conversionValue);
  } else if (eventData['x-ga-mp1-ev']) {
    payload.conversionValue = makeNumber(eventData['x-ga-mp1-ev']);
  } else if (eventData['x-ga-mp1-tr']) {
    payload.conversionValue = makeNumber(eventData['x-ga-mp1-tr']);
  } else {
    payload.conversionValue = getValueFromItems();
  }

  // currency
  payload.currency = data.currencyCode ||
    eventData.currency ||
    eventData.currencyCode ||
    'BRL';

  // eventSource
  payload.eventSource = data.eventSource || 'OTHER';

  // Click attribution
  var gclid = data.gclid || eventData.gclid;
  var gbraid = data.gbraid || eventData.gbraid;
  var wbraid = data.wbraid || eventData.wbraid;

  if (gclid) payload.gclid = gclid;
  if (gbraid) payload.gbraid = gbraid;
  if (wbraid) payload.wbraid = wbraid;

  // User data (raw — backend handles hashing via PiiHashingService)
  var userData = buildUserData();
  if (userData) payload.userData = userData;

  // Cart data
  var cartData = buildCartData();
  if (cartData) payload.cartData = cartData;

  // Extra fields
  payload.userAgent = data.userAgent || getRequestHeader('user-agent') || '';

  if (data.ipAddress) payload.ipAddress = data.ipAddress;

  // Consent
  if (data.adUserData) payload.adUserData = data.adUserData;
  if (data.adPersonalization) payload.adPersonalization = data.adPersonalization;

  // Product destination ID
  if (data.productDestinationId) payload.productDestinationId = data.productDestinationId;

  // validateOnly
  payload.validateOnly = data.validateOnly || false;

  return payload;
}

/**********************************************************************************************/
// User data builder

function buildUserData() {
  var userEventData = {};
  if (getType(eventData.user_data) === 'object') {
    userEventData = eventData.user_data;
  } else if (getType(eventData.user_properties) === 'object') {
    userEventData = eventData.user_properties;
  }

  var ud = {};
  var hasData = false;

  // Email
  var email = data.email ||
    eventData.email ||
    eventData.email_address ||
    userEventData.email ||
    userEventData.email_address;
  if (email) { ud.email = makeString(email); hasData = true; }

  // Phone
  var phone = data.phoneNumber ||
    eventData.phone ||
    eventData.phone_number ||
    userEventData.phone ||
    userEventData.phone_number;
  if (phone) { ud.phoneNumber = makeString(phone); hasData = true; }

  // Name
  var firstName = data.firstName ||
    userEventData.first_name ||
    userEventData.firstName;
  if (firstName) { ud.firstName = makeString(firstName); hasData = true; }

  var lastName = data.lastName ||
    userEventData.last_name ||
    userEventData.lastName;
  if (lastName) { ud.lastName = makeString(lastName); hasData = true; }

  // Address
  if (data.streetAddress) { ud.streetAddress = data.streetAddress; hasData = true; }
  if (data.city) { ud.city = data.city; hasData = true; }
  if (data.regionCode) { ud.regionCode = data.regionCode; hasData = true; }
  if (data.postalCode) { ud.postalCode = data.postalCode; hasData = true; }
  if (data.countryCode) { ud.countryCode = data.countryCode; hasData = true; }

  return hasData ? ud : undefined;
}

/**********************************************************************************************/
// Cart data builder

function buildCartData() {
  var items = eventData.items;
  if (!items || !items[0]) return undefined;

  var cartItems = [];
  items.forEach(function(item) {
    var cartItem = {};

    if (item.item_id) cartItem.itemId = makeString(item.item_id);
    else if (item.id) cartItem.itemId = makeString(item.id);

    if (item.item_price) cartItem.unitPrice = makeNumber(item.item_price);
    else if (item.price) cartItem.unitPrice = makeNumber(item.price);

    if (item.item_quantity) cartItem.quantity = makeInteger(item.item_quantity);
    else if (item.quantity) cartItem.quantity = makeInteger(item.quantity);
    else cartItem.quantity = 1;

    if (item.item_name) cartItem.itemName = makeString(item.item_name);
    else if (item.name) cartItem.itemName = makeString(item.name);

    cartItems.push(cartItem);
  });

  return { items: cartItems };
}

/**********************************************************************************************/
// Google Data Manager API payload builder (own credentials mode)

function buildGooglePayload() {
  var event = {
    transactionId: postBody.transactionId,
    eventTimestamp: postBody.eventTimestamp,
    eventSource: mapEventSource(postBody.eventSource),
    conversionValue: postBody.conversionValue,
    currency: postBody.currency
  };

  // adIdentifiers
  var adId = {};
  if (postBody.gclid) adId.gclid = postBody.gclid;
  if (postBody.gbraid) adId.gbraid = postBody.gbraid;
  if (postBody.wbraid) adId.wbraid = postBody.wbraid;
  if (postBody.userAgent) adId.landingPageDeviceInfo = { userAgent: postBody.userAgent };
  if (hasKeys(adId)) event.adIdentifiers = adId;

  // userData with SHA-256 hashing client-side
  var userIdentifiers = buildUserIdentifiers();
  if (userIdentifiers.length) {
    event.userData = { userIdentifiers: userIdentifiers };
  }

  // cartData
  if (postBody.cartData) event.cartData = postBody.cartData;

  // consent
  var consent = {};
  if (data.adUserData) consent.adUserData = data.adUserData;
  if (data.adPersonalization) consent.adPersonalization = data.adPersonalization;
  if (hasKeys(consent)) event.consent = consent;

  // eventDeviceInfo
  var deviceInfo = {};
  if (postBody.userAgent) deviceInfo.userAgent = postBody.userAgent;
  if (postBody.ipAddress) deviceInfo.ipAddress = postBody.ipAddress;
  if (hasKeys(deviceInfo)) event.eventDeviceInfo = deviceInfo;

  var payload = {
    destinations: [{
      operatingAccount: { accountType: 'GOOGLE_ADS', accountId: makeString(data.destinationAccountId) },
      productDestinationId: makeString(data.productDestinationId)
    }],
    events: [event],
    validateOnly: data.validateOnly || false
  };

  if (userIdentifiers.length) {
    payload.encoding = 'HEX';
  }

  return payload;
}

function buildUserIdentifiers() {
  var ids = [];
  var ud = buildUserData();
  if (!ud) return ids;

  if (ud.email) ids.push({ emailAddress: hashForGoogle(ud.email, 'email') });
  if (ud.phoneNumber) ids.push({ phoneNumber: hashForGoogle(ud.phoneNumber, 'phone') });
  if (ud.firstName || ud.lastName || ud.regionCode || ud.postalCode) {
    var addr = {};
    if (ud.firstName) addr.givenName = hashForGoogle(ud.firstName, 'name');
    if (ud.lastName) addr.familyName = hashForGoogle(ud.lastName, 'name');
    if (ud.regionCode) addr.regionCode = ud.regionCode;
    if (ud.postalCode) addr.postalCode = ud.postalCode;
    ids.push({ address: addr });
  }
  return ids;
}

function hashForGoogle(value, type) {
  if (isAlreadyHashed(value)) return value;
  var v = makeString(value);
  if (type === 'email') v = v.trim().toLowerCase();
  if (type === 'phone') {
    v = stripNonDigits(v);
    if (v.indexOf('+') !== 0) {
      if (v.indexOf('55') !== 0) v = '55' + v;
      v = '+' + v;
    }
  }
  if (type === 'name') v = v.trim().toLowerCase();
  return sha256Sync(v, { outputEncoding: 'hex' });
}

function stripNonDigits(str) {
  var result = '';
  for (var i = 0; i < str.length; i++) {
    var c = str.charAt(i);
    if ((c >= '0' && c <= '9') || c === '+') result += c;
  }
  return result;
}

function isAlreadyHashed(val) {
  if (!val) return false;
  var s = makeString(val);
  if (s.length !== 64) return false;
  for (var i = 0; i < s.length; i++) {
    var c = s.charAt(i);
    if (!((c >= '0' && c <= '9') || (c >= 'a' && c <= 'f'))) return false;
  }
  return true;
}

function hasKeys(obj) {
  for (var k in obj) {
    if (obj.hasOwnProperty(k)) return true;
  }
  return false;
}

function mapEventSource(source) {
  if (source === 'OFFLINE') return 'OTHER';
  if (source === 'STORE') return 'IN_STORE';
  return source;
}

/**********************************************************************************************/
// Helpers

function getValueFromItems() {
  var items = eventData.items;
  if (!items || !items[0]) return 1;

  var total = 0;
  items.forEach(function(item) {
    var price = makeNumber(item.item_price || item.price || 0);
    var qty = makeInteger(item.item_quantity || item.quantity || 1);
    total += price * qty;
  });

  return total || 1;
}

function getFieldValue() {
  for (var i = 0; i < arguments.length; i++) {
    if (arguments[i]) return makeString(arguments[i]);
  }
  return undefined;
}

function convertTimestampToISO(timestamp) {
  var secToMs = function (s) { return s * 1000; };
  var minToMs = function (m) { return m * secToMs(60); };
  var hoursToMs = function (h) { return h * minToMs(60); };
  var daysToMs = function (d) { return d * hoursToMs(24); };
  var format = function (value) {
    return value >= 10 ? value.toString() : '0' + value;
  };
  var fourYearsInMs = daysToMs(365 * 4 + 1);
  var year = 1970 + Math.floor(timestamp / fourYearsInMs) * 4;
  timestamp = timestamp % fourYearsInMs;

  while (true) {
    var isLeapYear = !(year % 4);
    var nextTimestamp = timestamp - daysToMs(isLeapYear ? 366 : 365);
    if (nextTimestamp < 0) break;
    timestamp = nextTimestamp;
    year = year + 1;
  }

  var daysByMonth =
    year % 4 === 0
      ? [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
      : [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  var month = 0;
  for (var i = 0; i < daysByMonth.length; i++) {
    var msInThisMonth = daysToMs(daysByMonth[i]);
    if (timestamp > msInThisMonth) {
      timestamp = timestamp - msInThisMonth;
    } else {
      month = i + 1;
      break;
    }
  }
  var date = Math.ceil(timestamp / daysToMs(1));
  timestamp = timestamp - daysToMs(date - 1);
  var hours = Math.floor(timestamp / hoursToMs(1));
  timestamp = timestamp - hoursToMs(hours);
  var minutes = Math.floor(timestamp / minToMs(1));
  timestamp = timestamp - minToMs(minutes);
  var sec = Math.floor(timestamp / secToMs(1));

  return (
    year + '-' + format(month) + '-' + format(date) +
    'T' + format(hours) + ':' + format(minutes) + ':' + format(sec) + 'Z'
  );
}

function enc(data) {
  data = data || '';
  return encodeUriComponent(data);
}

function isConsentGivenOrNotRequired() {
  if (data.adStorageConsent !== 'required') return true;
  if (eventData.consent_state) return !!eventData.consent_state.ad_storage;
  var xGaGcs = eventData['x-ga-gcs'] || '';
  return xGaGcs[2] === '1';
}

/**********************************************************************************************/
// Logging

function log(rawDataToLog) {
  var logDestinationsHandlers = {};
  if (determinateIsLoggingEnabled())
    logDestinationsHandlers.console = logConsole;
  if (determinateIsLoggingEnabledForBigQuery())
    logDestinationsHandlers.bigQuery = logToBigQuery;

  var keyMappings = {
    bigQuery: {
      Name: 'tag_name',
      Type: 'type',
      TraceId: 'trace_id',
      EventName: 'event_name',
      RequestMethod: 'request_method',
      RequestUrl: 'request_url',
      RequestBody: 'request_body',
      ResponseStatusCode: 'response_status_code',
      ResponseHeaders: 'response_headers',
      ResponseBody: 'response_body'
    }
  };

  for (var logDestination in logDestinationsHandlers) {
    var handler = logDestinationsHandlers[logDestination];
    if (!handler) continue;

    var mapping = keyMappings[logDestination];
    var dataToLog = mapping ? {} : rawDataToLog;

    if (mapping) {
      for (var key in rawDataToLog) {
        var mappedKey = mapping[key] || key;
        dataToLog[mappedKey] = rawDataToLog[key];
      }
    }

    handler(dataToLog);
  }
}

function logConsole(dataToLog) {
  logToConsole(JSON.stringify(dataToLog));
}

function logToBigQuery(dataToLog) {
  var connectionInfo = {
    projectId: data.logBigQueryProjectId,
    datasetId: data.logBigQueryDatasetId,
    tableId: data.logBigQueryTableId
  };

  dataToLog.timestamp = getTimestampMillis();

  ['request_body', 'response_headers', 'response_body'].forEach(function(p) {
    dataToLog[p] = JSON.stringify(dataToLog[p]);
  });

  var bigquery =
    getType(BigQuery) === 'function'
      ? BigQuery()
      : BigQuery;
  bigquery.insert(connectionInfo, [dataToLog], { ignoreUnknownValues: true });
}

function determinateIsLoggingEnabled() {
  var containerVersion = getContainerVersion();
  var isDebug = !!(
    containerVersion &&
    (containerVersion.debugMode || containerVersion.previewMode)
  );

  if (!data.logType) return isDebug;
  if (data.logType === 'no') return false;
  if (data.logType === 'debug') return isDebug;
  return data.logType === 'always';
}

function determinateIsLoggingEnabledForBigQuery() {
  if (data.bigQueryLogType === 'no') return false;
  return data.bigQueryLogType === 'always';
}


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "headerWhitelist",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "trace-id"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "referer"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "x-user-id"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "user-agent"
                  }
                ]
              }
            ]
          }
        },
        {
          "key": "headersAllowed",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_container_data",
        "versionId": "1"
      },
      "param": []
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "use_google_credentials",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedScopes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://www.googleapis.com/auth/adwords"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_bigquery",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedTables",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "projectId"
                  },
                  {
                    "type": 1,
                    "string": "datasetId"
                  },
                  {
                    "type": 1,
                    "string": "tableId"
                  },
                  {
                    "type": 1,
                    "string": "operation"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 19/02/2026
Google Data Manager offline conversion template for Waster platform.
Sends conversion events to POST /google-conversions/events via Waster proxy (x-user-id header)
or directly to Google Data Manager API using own credentials.
Based on the Google Ads Offline Conversion Waster template pattern.
