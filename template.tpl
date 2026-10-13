___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "displayName": "Google Conversion Events - Waster",
  "categories": [
    "ADVERTISING",
    "ANALYTICS",
    "CONVERSIONS",
    "MARKETING",
    "REMARKETING"
  ],
  "brand": {
    "id": "brand_dummy",
    "displayName": "Waster"
  },
  "description": "Send conversion events to Google\u0027s advertising platforms via Waster proxy or your own credentials using the Data Manager API.",
  "containerContexts": [
    "SERVER"
  ],
  "securityGroups": []
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "RADIO",
    "name": "eventType",
    "displayName": "Event Type",
    "radioItems": [
      {
        "value": "conversion",
        "displayValue": "Conversion"
      },
      {
        "value": "pageview",
        "displayValue": "Pageview"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "conversion",
    "help": "\u003cb\u003eConversion\u003c/b\u003e\n\u003cbr/\u003e\nSends the conversion event.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003ePageview\u003c/b\u003e \n\u003cbr/\u003e\nSets the the \u003ci\u003e_dm_session_attributes\u003c/i\u003e cookie containing a base64 JSON encoded string with the \u003ci\u003eSession Attributes\u003c/i\u003e values for conversion event attribution and modeling.\n\u003cbr/\u003e\nDefault mappings: \n\u003cul\u003e \n\u003cli\u003eSession Attribute \u003ci\u003egad_source\u003c/i\u003e: \u003ci\u003egad_source\u003c/i\u003e URL Parameter value \u003c/li\u003e\n\u003cli\u003eSession Attribute \u003ci\u003egad_campaignid\u003c/i\u003e: \u003ci\u003egad_campaignid\u003c/i\u003e URL Parameter value\u003c/li\u003e \u003cli\u003eSession Attribute \u003ci\u003elanding_page_url\u003c/i\u003e: \u003ci\u003epage_location\u003c/i\u003e Event Data value\u003c/li\u003e\n\u003cli\u003eSession Attribute \u003ci\u003elanding_page_referrer\u003c/i\u003e: \u003ci\u003epage_referrer\u003c/i\u003e Event Data value\u003c/li\u003e\u003c/li\u003e\n\u003cli\u003eSession Attribute \u003ci\u003elanding_page_user_agent\u003c/i\u003e: \u003ci\u003euser_agent\u003c/i\u003e Event Data value\u003c/li\u003e\u003c/li\u003e\n\u003cli\u003eSession Attribute \u003ci\u003esession_start_time_usec\u003c/i\u003e: current timestamp of the time when the Pageview tag set the cookie\u003c/li\u003e\n\u003c/ul\u003e\n\u003cbr/\u003e Learn more: \u003ca href\u003d\"https://support.google.com/google-ads/answer/16194756?hl\u003den\"\u003e[1]\u003c/a\u003e and \u003ca href\u003d\"https://ads-developers.googleblog.com/2025/08/maximize-performance-of-your-google-ads.html\"\u003e[2]\u003c/a\u003e."
  },
  {
    "type": "GROUP",
    "name": "pageviewGroup",
    "subParams": [
      {
        "type": "GROUP",
        "name": "cookieSettingsGroup",
        "displayName": "Session Attributes Cookie Settings (Web only)",
        "groupStyle": "ZIPPY_OPEN",
        "subParams": [
          {
            "type": "TEXT",
            "name": "cookieExpiration",
            "displayName": "Cookie Expiration",
            "simpleValueType": true,
            "help": "The number of days Session Attributes cookie will live.\n\u003cbr\u003e\u003cbr\u003e\nGoogle advertising platforms have a maximum lookback window of 90 days. Therefore, it\u0027s advised not to exceed 90 days of expiration.",
            "valueUnit": "days",
            "defaultValue": 90,
            "valueHint": "90",
            "valueValidators": [
              {
                "type": "NON_NEGATIVE_NUMBER"
              }
            ]
          },
          {
            "type": "TEXT",
            "name": "cookieDomain",
            "displayName": "Cookie Domain",
            "simpleValueType": true,
            "help": "Overrides the cookie domain (defaults to \u003cb\u003eauto\u003c/b\u003e).\n\u003cbr/\u003e\nEnter your website\u0027s top-level domain as a fixed value (e.g., example.com).\n\u003cbr/\u003e\nIf left as default, the top-level domain will be automatically determined using the following priority:\n\u003cul\u003e\n\u003cli\u003eTop-level domain of the \u003ci\u003eForwarded\u003c/i\u003e header (if present).\u003c/li\u003e\n\u003cli\u003eTop-level domain of the \u003ci\u003eX-Forwarded-Host\u003c/i\u003e header (if present).\u003c/li\u003e\n\u003cli\u003eTop-level domain of the \u003ci\u003eHost\u003c/i\u003e header.\u003c/li\u003e\n\u003c/ul\u003e",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "defaultValue": "auto",
            "valueHint": "example.com"
          },
          {
            "type": "SELECT",
            "name": "cookieSameSite",
            "displayName": "Cookie SameSite",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": "none",
                "displayValue": "None"
              },
              {
                "value": "lax",
                "displayValue": "Lax"
              },
              {
                "value": "strict",
                "displayValue": "Strict"
              }
            ],
            "simpleValueType": true,
            "defaultValue": "none",
            "help": "\u003ca href\u003d\"https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value\"\u003eLearn more\u003c/a\u003e."
          },
          {
            "type": "SELECT",
            "name": "cookieHttpOnly",
            "displayName": "Http Only Flag",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": false,
                "displayValue": "False"
              },
              {
                "value": true,
                "displayValue": "True"
              }
            ],
            "simpleValueType": true,
            "defaultValue": true
          }
        ]
      }
    ],
    "enablingConditions": [
      {
        "paramName": "eventType",
        "paramValue": "pageview",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "conversionGroup",
    "subParams": [
      {
        "type": "RADIO",
        "name": "authFlow",
        "displayName": "Authentication Type",
        "radioItems": [
          {
            "value": "waster",
            "displayValue": "Waster Proxy",
            "help": "Use the Waster proxy to authenticate with Google APIs.",
            "subParams": []
          },
          {
            "value": "own",
            "displayValue": "Own Google Credentials",
            "help": "This type of auth is more complicated. Only choose it if you know what you are doing and do not want to use the Waster Proxy authentication.\n\u003cbr/\u003e\u003cbr/\u003e\nIt uses the \u003ca href\u003d\"https://cloud.google.com/docs/authentication/application-default-credentials\"\u003eGCP Application Default Credentials\u003c/a\u003e to automatically find credentials from the server environment.\n\u003cbr/\u003e\u003cbr/\u003e\nIt\u0027s performed through a \u003ca href\u003d\"https://developers.google.com/data-manager/api/devguides/quickstart/set-up-access?credential_type\u003dservice_account\"\u003eService Account impersonation\u003c/a\u003e.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003ca href\u003d\"https://github.com/stape-io/google-conversion-events-tag?tab\u003dreadme-ov-file#how-to-use-the-google-conversion-events-tag\"\u003eLearn more and how-to\u003c/a\u003e."
          }
        ],
        "simpleValueType": true,
        "defaultValue": "waster"
      },
      {
        "type": "GROUP",
        "name": "destinationsGroup",
        "subParams": [
          {
            "type": "SIMPLE_TABLE",
            "name": "wasterAuthDestinationsList",
            "displayName": "Destination Accounts and Conversion Events",
            "simpleTableColumns": [
              {
                "defaultValue": "GOOGLE_ADS",
                "displayName": "Product",
                "name": "product",
                "type": "SELECT",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "selectItems": [
                  {
                    "value": "GOOGLE_ADS",
                    "displayValue": "Google Ads"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "Operating Customer ID",
                "name": "operatingAccountId",
                "type": "TEXT",
                "valueHint": "1234567890",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  },
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "Login Customer ID (MCC)",
                "name": "loginAccountId",
                "type": "TEXT",
                "valueValidators": [],
                "valueHint": "1234567890"
              },
              {
                "defaultValue": "",
                "displayName": "Conversion Event ID",
                "name": "productDestinationId",
                "type": "TEXT",
                "valueHint": "1234567890",
                "isUnique": true,
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  },
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ]
              }
            ],
            "enablingConditions": [
              {
                "paramName": "authFlow",
                "paramValue": "waster",
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "TABLE_ROW_COUNT",
                "args": [
                  1,
                  10
                ]
              }
            ],
            "newRowButtonText": "Add Conversion Event",
            "help": "\u003cb\u003eProduct\u003c/b\u003e: The Product the Conversion belongs to.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003eOperating Customer ID\u003c/b\u003e: The \u003ci\u003eAccount ID\u003c/i\u003e (without hyphens) of the account (Google Ads account, DV360 account etc.) that will receive the conversion events. \u003ca href\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/Destination\"\u003eLearn more\u003c/a\u003e.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003eLogin Customer ID (MCC)\u003c/b\u003e: Optional. The \u003ci\u003eAccount ID\u003c/i\u003e (without hyphens) of the manager account (MCC) through which the Google account connected to Wascer accesses the \u003ci\u003eOperating Customer ID\u003c/i\u003e.\n\u003cbr/\u003e\ne.g. the Google account connected to Wascer has access to the MCC, and the conversions belong to a subaccount of that MCC. In this case, the \u003ci\u003eLogin Customer ID\u003c/i\u003e is the MCC and the \u003ci\u003eOperating Customer ID\u003c/i\u003e is the subaccount.\n\u003cbr/\u003e\nLeave it empty when the connected Google account has direct access to the \u003ci\u003eOperating Customer ID\u003c/i\u003e.\n\u003cbr/\u003e\n\u003ca href\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/Destination\"\u003eLearn more\u003c/a\u003e.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003eConversion Event ID\u003c/b\u003e: The ID of the conversion you want to interact with.\n\u003cbr/\u003e\nYou can find it by going to the \u003ci\u003eGoogle Ads account \u003e Goals \u003e Conversions \u003e Summary \u003e Access the desired Conversion Action\u003c/i\u003e. After you click on the Conversion Action, the ID is on the \u003cb\u003ectId\u003c/b\u003e URL query parameter on your browser.\n\u003cbr/\u003e"
          },
          {
            "type": "SIMPLE_TABLE",
            "name": "ownAuthDestinationsList",
            "displayName": "Destination Accounts and Conversion Events",
            "simpleTableColumns": [
              {
                "defaultValue": "GOOGLE_ADS",
                "displayName": "Product",
                "name": "product",
                "type": "SELECT",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "selectItems": [
                  {
                    "value": "GOOGLE_ADS",
                    "displayValue": "Google Ads"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "Operating Customer ID",
                "name": "operatingAccountId",
                "type": "TEXT",
                "valueHint": "1234567890",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  },
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "Customer ID",
                "name": "loginAccountId",
                "type": "TEXT",
                "valueHint": "1234567890",
                "valueValidators": []
              },
              {
                "defaultValue": "",
                "displayName": "Conversion Event ID",
                "name": "productDestinationId",
                "type": "TEXT",
                "valueHint": "1234567890",
                "isUnique": true,
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  },
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ]
              }
            ],
            "enablingConditions": [
              {
                "paramName": "authFlow",
                "paramValue": "own",
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "TABLE_ROW_COUNT",
                "args": [
                  1,
                  10
                ]
              }
            ],
            "newRowButtonText": "Add Conversion Event",
            "help": "\u003cb\u003eProduct\u003c/b\u003e: The Product the Conversion belongs to.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003eOperating Customer ID\u003c/b\u003e: The \u003ci\u003eAccount ID\u003c/i\u003e (without hyphens) of the account (Google Ads account, DV360 account etc.) that will receive the conversion events. \u003ca href\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/Destination\"\u003eLearn more\u003c/a\u003e.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003eCustomer ID\u003c/b\u003e: The \u003ci\u003eAccount ID\u003c/i\u003e of the account (Google Ads account, DV360 account etc.) used for authorization (without hyphens) when making the API request.\n\u003cbr/\u003e\nIf your credentials are for access to a \u003ci\u003eManager Account\u003c/i\u003e that has the \u003ci\u003eOperating Account\u003c/i\u003e as one of its subaccounts, set the \u003ci\u003eCustomer ID\u003c/i\u003e to the ID of the \u003ci\u003eManager Account\u003c/i\u003e.\n\u003cbr/\u003e\nIf your credentials are for the account that is the \u003ci\u003eOperating Account\u003c/i\u003e, you don\u0027t need to set \u003ci\u003eCustomer ID\u003c/i\u003e.\n\u003cbr/\u003e\nLearn more: \u003ca href\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/Destination\"\u003e[1]\u003c/a\u003e and \u003ca href\u003d\"https://developers.google.com/data-manager/api/get-started/quickstart/send-events?persona\u003dadvertiser#prepare_a_destination\"\u003e[2]\u003c/a\u003e.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003eConversion Event ID\u003c/b\u003e: The ID of the conversion you want to interact with.\n\u003cbr/\u003e\nYou can find it by going to the \u003ci\u003eGoogle Ads account \u003e Goals \u003e Conversions \u003e Summary \u003e Access the desired Conversion Action\u003c/i\u003e. After you click on the Conversion Action, the ID is on the \u003cb\u003ectId\u003c/b\u003e URL query parameter on your browser.\n\u003cbr/\u003e"
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "validateOnly",
        "displayName": "Validate Only",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": true,
            "displayValue": "true"
          },
          {
            "value": false,
            "displayValue": "false"
          }
        ],
        "simpleValueType": true,
        "help": "If \u003cb\u003etrue\u003c/b\u003e, the request is validated but not executed. Only errors are returned, not results.\u003cbr /\u003e \u003ca href\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#request-body\"\u003eLearn more\u003c/a\u003e.",
        "defaultValue": false
      },
      {
        "type": "SELECT",
        "name": "useOptimisticScenario",
        "displayName": "Use Optimistic Scenario",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": true,
            "displayValue": "true"
          },
          {
            "value": false,
            "displayValue": "false"
          }
        ],
        "simpleValueType": true,
        "help": "The tag will call gtmOnSuccess() without waiting for a response from the API. This will speed up sGTM response time however your tag will always return the status fired successfully even in case it is not.",
        "defaultValue": false
      },
      {
        "type": "GROUP",
        "name": "requestLevelConsentGroup",
        "displayName": "Request-level Consent",
        "groupStyle": "ZIPPY_OPEN_ON_PARAM",
        "subParams": [
          {
            "type": "LABEL",
            "name": "requestLevelConsentGroupLabel",
            "displayName": "Request-level consent to apply to all users in the request.\n\u003cbr/\u003e\nUser-level consent overrides request-level consent, and can be specified for each conversion event when sending data to \u003ci\u003eMultiple Conversion Events\u003c/i\u003e in the \u003cb\u003eConversion Events\u003c/b\u003e section."
          },
          {
            "type": "SELECT",
            "name": "adUserData",
            "displayName": "Consent for Ad User Data",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": "CONSENT_GRANTED",
                "displayValue": "CONSENT_GRANTED"
              },
              {
                "value": "CONSENT_DENIED",
                "displayValue": "CONSENT_DENIED"
              },
              {
                "value": "CONSENT_STATUS_UNSPECIFIED",
                "displayValue": "CONSENT_STATUS_UNSPECIFIED"
              }
            ],
            "simpleValueType": true,
            "help": "This represents consent to Ad User Data. \n\u003cbr/\u003e\nWhen passing the value using a variable, make sure to return the exact strings as defined in the drop-down: \u003ci\u003eCONSENT_GRANTED\u003c/i\u003e, \u003ci\u003eCONSENT_DENIED\u003c/i\u003e and \u003ci\u003eCONSENT_STATUS_UNSPECIFIED\u003c/i\u003e.",
            "notSetText": "(not set)"
          },
          {
            "type": "SELECT",
            "name": "adPersonalization",
            "displayName": "Consent for Ad Personalization",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": "CONSENT_GRANTED",
                "displayValue": "CONSENT_GRANTED"
              },
              {
                "value": "CONSENT_DENIED",
                "displayValue": "CONSENT_DENIED"
              },
              {
                "value": "CONSENT_STATUS_UNSPECIFIED",
                "displayValue": "CONSENT_STATUS_UNSPECIFIED"
              }
            ],
            "simpleValueType": true,
            "help": "This represents consent to Ad Personalization.\n\u003cbr/\u003e\nWhen passing the value using a variable, make sure to return the exact strings as defined in the drop-down: \u003ci\u003eCONSENT_GRANTED\u003c/i\u003e, \u003ci\u003eCONSENT_DENIED\u003c/i\u003e and \u003ci\u003eCONSENT_STATUS_UNSPECIFIED\u003c/i\u003e.",
            "notSetText": "(not set)"
          }
        ]
      },
      {
        "type": "GROUP",
        "name": "conversionEventsGroup",
        "displayName": "Conversion Events",
        "groupStyle": "ZIPPY_OPEN",
        "subParams": [
          {
            "type": "SELECT",
            "name": "userDataEncoding",
            "displayName": "User Data Encoding",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": "HEX",
                "displayValue": "HEX"
              },
              {
                "value": "BASE64",
                "displayValue": "BASE64"
              }
            ],
            "simpleValueType": true,
            "help": "The encoding type of the user identifiers SHA256 hash: \u003ci\u003eHEX\u003c/i\u003e or \u003ci\u003eBASE64\u003c/i\u003e.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003eRequired\u003c/b\u003e for \u003ca href\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/UserData\"\u003e\u003ci\u003eUserData\u003c/i\u003e\u003c/a\u003e (User Email Address, User Phone Number and User Given/Family Name) uploads.\n\u003cbr/\u003e\nFor other types (User Address Region and User Address Postal Code) uploads, this field is \u003cb\u003eignored\u003c/b\u003e.\n\u003cbr/\u003e\u003cbr/\u003e\nFor hashed user identifiers, this is the encoding type of the hashed string. \n\u003cbr/\u003e\nFor encrypted hashed user identifiers, this is the encoding type of the outer encrypted string, but not necessarily the inner hashed string, meaning the inner hashed string could be encoded in a different way than the outer encrypted string.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003eDefault\u003c/b\u003e: \u003ci\u003eHEX\u003c/i\u003e - when passing a non-hashed value to \u003ci\u003eUserData\u003c/i\u003e (User Email Address, User Phone Number and User Given/Family Name) fields; or when using default values from GA4 Event Data.",
            "notSetText": "(not set)"
          },
          {
            "type": "SELECT",
            "name": "enableUserDataEncryption",
            "displayName": "User Data Encryption",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": false,
                "displayValue": "false"
              },
              {
                "value": true,
                "displayValue": "true"
              }
            ],
            "simpleValueType": true,
            "help": "Encryption information for \u003ca href\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/UserData\"\u003e\u003ci\u003eUserData\u003c/i\u003e\u003c/a\u003e (User Email Address, User Phone Number and User Given/Family Name) uploads.\n\u003cbr/\u003e\u003cbr/\u003e\nIf not set, it\u0027s assumed that uploaded identifying information is hashed but not encrypted.\n\u003cbr/\u003e\u003cbr/\u003e \nFor other types (User Address Region and User Address Postal Code) uploads, this field is \u003cb\u003eignored\u003c/b\u003e.\n\u003cbr/\u003e\u003cbr/\u003e\nReferences:  \n\u003cul\u003e \n\u003cli\u003e\u003ca href\u003d\"https://developers.google.com/data-manager/api/get-started/encryption\"\u003eData Manager API: Getting started with Encryption\u003c/a\u003e\u003c/li\u003e \u003cli\u003e\u003ca href\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/EncryptionInfo\"\u003eEncryptionInfo object\u003c/a\u003e\u003c/li\u003e \u003c/ul\u003e",
            "defaultValue": false,
            "subParams": [
              {
                "type": "GROUP",
                "name": "userDataEncryptionInfoGroup",
                "displayName": "Encryption Info (Google Cloud Platform wrapped key information)",
                "groupStyle": "ZIPPY_OPEN_ON_PARAM",
                "subParams": [
                  {
                    "type": "SELECT",
                    "name": "gcpWrappedKeyType",
                    "displayName": "Key Type",
                    "macrosInSelect": false,
                    "selectItems": [
                      {
                        "value": "XCHACHA20_POLY1305",
                        "displayValue": "XCHACHA20_POLY1305"
                      }
                    ],
                    "simpleValueType": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ],
                    "help": "The type of algorithm used to encrypt the data."
                  },
                  {
                    "type": "TEXT",
                    "name": "gcpWrappedKeyWipProvider",
                    "displayName": "Workload Identity pool provider",
                    "simpleValueType": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ],
                    "help": "The \u003ca href\u003d\"https://cloud.google.com/iam/docs/workload-identity-federation\"\u003eWorkload Identity\u003c/a\u003e pool provider required to use KEK."
                  },
                  {
                    "type": "TEXT",
                    "name": "gcpWrappedKeyKekUri",
                    "displayName": "Google Cloud Platform Cloud Key Management Service resource ID",
                    "simpleValueType": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ],
                    "help": "The Google Cloud Platform \u003ca href\u003d\"https://cloud.google.com/kms/docs/getting-resource-ids\"\u003eCloud Key Management Service resource ID\u003c/a\u003e."
                  },
                  {
                    "type": "TEXT",
                    "name": "gcpWrappedKeyEncryptedDek",
                    "displayName": "Encrypted data encryption key",
                    "simpleValueType": true,
                    "help": "The base64 encoded encrypted data encryption key.",
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  }
                ],
                "enablingConditions": [
                  {
                    "paramName": "enableUserDataEncryption",
                    "paramValue": false,
                    "type": "NOT_EQUALS"
                  }
                ]
              }
            ]
          },
          {
            "type": "SELECT",
            "name": "conversionEventMode",
            "displayName": "Conversion Event Mode",
            "macrosInSelect": false,
            "selectItems": [
              {
                "value": "single",
                "displayValue": "Single Conversion Event (Recommended)"
              },
              {
                "value": "multiple",
                "displayValue": "Multiple Conversion Events"
              }
            ],
            "simpleValueType": true,
            "help": "Send data for a single conversion event or for multiple conversion events."
          },
          {
            "type": "GROUP",
            "name": "conversionEventsMultipleGroup",
            "subParams": [
              {
                "type": "TEXT",
                "name": "conversionEvents",
                "displayName": "Conversion Events Array",
                "simpleValueType": true,
                "help": "Specify the Conversion Events array. This is useful when you need to upload data for multiple conversion events at once. At most 2000 Conversion Events can be specified in the array.\n\u003cbr/\u003e\u003cbr/\u003e\nThe array must be formatted as specified in the\nGoogle Documentation. You can specify different consent types for each Conversion Event, overriding the request-level consent.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003eIf you already pass SHA256 hashed fields to \u003ca href\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/UserData\"\u003e\u003ci\u003eUserData\u003c/i\u003e\u003c/a\u003e field, make sure to specify the SHA256 hash encoding in the corresponding template field. Otherwise, the tag will hash it automatically and set it for you.\u003c/b\u003e\n\u003cbr/\u003e\u003cbr/\u003e\nWhen working with multiple Conversion Event IDs, you can direct an event to a specific subset of them. To do so, list the desired Conversion Event IDs in the \u003ca target\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#event\"\u003e\u003ci\u003edestinationReferences\u003c/i\u003e\u003c/a\u003e array.\n\u003cbr/\u003e\u003cbr/\u003e\nReferences: \n\u003cul\u003e\n\u003cli\u003e\u003ca href\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#Event\"\u003eConversion Event\u003c/a\u003e\u003c/li\u003e\n\u003cli\u003e\u003ca href\u003d\"https://developers.google.com/data-manager/api/get-started/formatting\"\u003eNormalization guidelines\u003c/a\u003e\u003c/li\u003e\n\u003cli\u003e\u003ca href\u003d\"https://developers.google.com/data-manager/api/get-started/quickstart/send-events?persona\u003dadvertiser#build_the_request_body\"\u003eExample\u003c/a\u003e\u003c/li\u003e\n\u003c/ul\u003e",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              }
            ],
            "enablingConditions": [
              {
                "paramName": "conversionEventMode",
                "paramValue": "multiple",
                "type": "EQUALS"
              }
            ],
            "groupStyle": "NO_ZIPPY"
          }
        ]
      },
      {
        "type": "GROUP",
        "name": "conversionEventsSingleGroup",
        "groupStyle": "NO_ZIPPY",
        "subParams": [
          {
            "type": "GROUP",
            "name": "conversionInformationGroup",
            "displayName": "Conversion Information",
            "groupStyle": "ZIPPY_OPEN",
            "subParams": [
              {
                "type": "SELECT",
                "name": "autoMapConversionInformation",
                "displayName": "Auto-map Conversion Information",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": true,
                    "displayValue": "true"
                  },
                  {
                    "value": false,
                    "displayValue": "false"
                  }
                ],
                "simpleValueType": true,
                "help": "If enabled, the tag will attempt to automatically map parameters from the Event Data.\n\u003cbr/\u003e\u003cbr/\u003e\nAny value you manually enter in a field below will always override the auto-mapped value.\n\u003cbr/\u003e\u003cbr/\u003e\nDefault mappings:\n\u003cul\u003e\n\u003cli\u003eTransaction/Order ID: \u003ci\u003eeventData.transaction_id\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003eCurrency: \u003ci\u003eeventData.currency\u003c/i\u003e\n\u003cli\u003eConversion Value: \u003ci\u003eeventData.value\u003c/i\u003e \u003e Sum of \u003ci\u003eeventData.items Price * Quantity\u003c/i\u003e\u003c/li\u003e\n\u003c/ul\u003e",
                "defaultValue": true
              },
              {
                "type": "SELECT",
                "name": "eventSource",
                "displayName": "Event Source",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": "WEB",
                    "displayValue": "WEB"
                  },
                  {
                    "value": "APP",
                    "displayValue": "APP"
                  },
                  {
                    "value": "IN_STORE",
                    "displayValue": "IN_STORE"
                  },
                  {
                    "value": "PHONE",
                    "displayValue": "PHONE"
                  },
                  {
                    "value": "OTHER",
                    "displayValue": "OTHER"
                  }
                ],
                "simpleValueType": true,
                "help": "\u003cb\u003eRequired.\u003c/b\u003e\n\u003cbr/\u003e\u003cbr/\u003e\nA signal for where the event happened originally (web, app, in-store, etc.).",
                "notSetText": "(not set)",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              },
              {
                "type": "TEXT",
                "name": "transactionId",
                "displayName": "Transaction/Order ID",
                "simpleValueType": true,
                "help": "The unique identifier for this event.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003eOptional\u003c/b\u003e when sending offline conversion or enhanced conversion for leads.\n\u003cbr/\u003e\n\u003cb\u003eRequired\u003c/b\u003e when sending offline conversion as an additional data source to boost performance and data strength of an online conversion.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003ca href\u003d\"https://developers.google.com/data-manager/api/devguides/events\"\u003eLearn more.\u003c/a\u003e"
              },
              {
                "type": "TEXT",
                "name": "eventTimestamp",
                "displayName": "Event Timestamp",
                "simpleValueType": true,
                "help": "\u003cb\u003eRequired.\u003c/b\u003e\n\u003cbr/\u003e\u003cbr/\u003e\nThe time the event occurred.\n\u003cbr/\u003e\u003cbr/\u003e\nThe supported formats are:\n\u003cul\u003e \n\u003cli\u003eRFC 3339 compliant formats:\n\u003cul\u003e\n\u003cli\u003e2014-10-02T15:01:23Z\u003c/li\u003e\n\u003cli\u003e2014-10-02T15:01:23.045123456Z\u003c/li\u003e\n\u003cli\u003e2014-10-02T15:01:23+05:30\u003c/li\u003e\n\u003c/ul\u003e\n\u003c/li\u003e \n\u003cli\u003eUnix timestamp (in seconds or milliseconds)\u003c/li\u003e\n\u003c/ul\u003e\n\u003cbr/\u003e\nIf not set, the tag will fallback to the current time if none is found."
              },
              {
                "type": "TEXT",
                "name": "lastUpdatedTimestamp",
                "displayName": "Last Updated Timestamp",
                "simpleValueType": true,
                "help": "The last time the event was updated.\n\u003cbr/\u003e\u003cbr/\u003e\nThe supported formats are:\n\u003cul\u003e \n\u003cli\u003eRFC 3339 compliant formats:\n\u003cul\u003e\n\u003cli\u003e2014-10-02T15:01:23Z\u003c/li\u003e\n\u003cli\u003e2014-10-02T15:01:23.045123456Z\u003c/li\u003e\n\u003cli\u003e2014-10-02T15:01:23+05:30\u003c/li\u003e\n\u003c/ul\u003e\n\u003c/li\u003e \n\u003cli\u003eUnix timestamp (in seconds or milliseconds)\u003c/li\u003e\n\u003c/ul\u003e"
              },
              {
                "type": "TEXT",
                "name": "currency",
                "displayName": "Currency",
                "simpleValueType": true,
                "help": "The currency code associated with all monetary values within this event.\n\u003cbr/\u003e\u003cbr/\u003e\nThe value must be a recognized currency code as per \u003ca href\u003d\"http://en.wikipedia.org/wiki/ISO_4217\"\u003eISO-4217 standard\u003c/a\u003e (e.g. EUR, USD, etc.)."
              },
              {
                "type": "TEXT",
                "name": "conversionValue",
                "displayName": "Conversion Value",
                "simpleValueType": true,
                "help": "The conversion value associated with the event, for value-based conversions."
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "userDataGroup",
            "displayName": "User Data",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "LABEL",
                "name": "userDataGroupLabel",
                "displayName": "When sending User Data Identifiers, \u003cb\u003eat least one\u003c/b\u003e of User Email Address(es), User Phone Number(s) or User Address must be specified.\n\u003cbr/\u003e\nThe total number of User Data identifiers must not exceed 10 items."
              },
              {
                "type": "SELECT",
                "name": "autoMapUserData",
                "displayName": "Auto-map Conversion Information",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": true,
                    "displayValue": "true"
                  },
                  {
                    "value": false,
                    "displayValue": "false"
                  }
                ],
                "simpleValueType": true,
                "help": "If enabled, the tag will attempt to automatically map parameters from the Event Data.\n\u003cbr/\u003e\u003cbr/\u003e\nAny value you manually enter in a field below will always override the auto-mapped value.\n\u003cbr/\u003e\u003cbr/\u003e\nDefault mappings:\n\u003cul\u003e\n\u003cli\u003eEmail: \u003ci\u003eeventData.email\u003c/i\u003e \u003e \u003ci\u003eeventData.email_address\u003c/i\u003e \u003e \u003ci\u003eeventData.user_data.email\u003c/i\u003e \u003e \u003ci\u003eeventData.user_data.email_address\u003c/i\u003e \u003e \u003ci\u003eeventData.user_data.sha256_email_address\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003ePhone: \u003ci\u003eeventData.phone\u003c/i\u003e \u003e \u003ci\u003eeventData.phone_number\u003c/i\u003e \u003e \u003ci\u003eeventData.user_data.phone\u003c/i\u003e \u003e \u003ci\u003eeventData.user_data.phone_number\u003c/i\u003e \u003e \u003ci\u003eeventData.user_data.sha256_phone_number\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003eUser Given Name: \u003ci\u003eeventData.user_data.address.first_name\u003c/i\u003e \u003e \u003ci\u003eeventData.user_data.address.sha256_first_name\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003eUser Family Name: \u003ci\u003eeventData.user_data.address.last_name\u003c/i\u003e \u003e \u003ci\u003eeventData.user_data.address.sha256_last_name\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003eUser Address Region: \u003ci\u003eeventData.user_data.address.country\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003eUser Address Postal Code: \u003ci\u003eeventData.user_data.address.postal_code\u003c/i\u003e\u003c/li\u003e\n\n\u003c/ul\u003e",
                "defaultValue": true
              },
              {
                "type": "TEXT",
                "name": "userDataEmailAddresses",
                "displayName": "User Email Address(es)",
                "simpleValueType": true,
                "help": "Specify a single email address, or an array of email addresses. Each item can be already SHA256 hashed or not. They can be already encrypted as well.\n\u003cbr/\u003e\u003cbr/\u003e\nIf already SHA256 hashed, make sure to follow these \u003ca href\u003d\"https://developers.google.com/data-manager/api/get-started/formatting#userdata_format\"\u003enormalization guidelines\u003c/a\u003e before applying the hash, and also to \u003cb\u003especify the hash encoding in the corresponding template field\u003c/b\u003e.",
                "valueHint": "jane@example.com"
              },
              {
                "type": "TEXT",
                "name": "userDataPhoneNumbers",
                "displayName": "User Phone Number(s)",
                "simpleValueType": true,
                "help": "Specify a single phone number, or an array of phone numbers. Each item can be already SHA256 hashed or not. They can be already encrypted as well.\n\u003cbr/\u003e\u003cbr/\u003e\nUse \u003ca href\u003d\"https://en.wikipedia.org/wiki/E.164\"\u003eE.164 format\u003c/a\u003e. Include the plus sign (+) and the country code.\n\u003cbr/\u003e\nIf already SHA256 hashed, make sure to follow these \u003ca href\u003d\"https://developers.google.com/data-manager/api/get-started/formatting#userdata_format\"\u003enormalization guidelines\u003c/a\u003e before applying the hash, and also to \u003cb\u003especify the hash encoding in the corresponding template field\u003c/b\u003e.",
                "valueHint": "+1555999999999"
              },
              {
                "type": "CHECKBOX",
                "name": "addUserDataAddress",
                "checkboxText": "Add User Address data",
                "simpleValueType": true,
                "subParams": [
                  {
                    "type": "GROUP",
                    "name": "userDataAddressGroup",
                    "subParams": [
                      {
                        "type": "LABEL",
                        "name": "userDataAddressLabel",
                        "displayName": "You must specify \u003cb\u003eall\u003c/b\u003e the fields below (User Given Name, User Family Name, User Address Region and User Address Postal Code)."
                      },
                      {
                        "type": "TEXT",
                        "name": "userDataAddressGivenName",
                        "displayName": "User Given Name",
                        "simpleValueType": true,
                        "help": "Specify the User Given Name (First Name). Don\u0027t include prefixes such as \u003ci\u003eMrs.\u003c/i\u003e. It can be already SHA256 hashed or not. It can be encrypted as well.\n\u003cbr/\u003e\u003cbr/\u003e\nIf already SHA256 hashed, make sure to follow these \u003ca href\u003d\"https://developers.google.com/data-manager/api/get-started/formatting#userdata_format\"\u003enormalization guidelines\u003c/a\u003e before applying the hash, and also to \u003cb\u003especify the hash encoding in the corresponding template field\u003c/b\u003e.",
                        "valueHint": "john",
                        "valueValidators": []
                      },
                      {
                        "type": "TEXT",
                        "name": "userDataAddressFamilyName",
                        "displayName": "User Family Name",
                        "simpleValueType": true,
                        "help": "Specify the User Family Name (Last Name). Don\u0027t include suffixes such as \u003ci\u003eJr\u003c/i\u003e. It can be already SHA256 hashed or not. It can be encrypted as well.\n\u003cbr/\u003e\u003cbr/\u003e\nIf already SHA256 hashed, make sure to follow these \u003ca href\u003d\"https://developers.google.com/data-manager/api/get-started/formatting#userdata_format\"\u003enormalization guidelines\u003c/a\u003e before applying the hash, and also to \u003cb\u003especify the hash encoding in the corresponding template field\u003c/b\u003e.",
                        "valueHint": "doe",
                        "valueValidators": []
                      },
                      {
                        "type": "TEXT",
                        "name": "userDataAddressRegion",
                        "displayName": "User Address Region",
                        "simpleValueType": true,
                        "help": "The 2-letter region code in \u003ca href\u003d\"https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2\"\u003eISO-3166-1 alpha-2\u003c/a\u003e of the user\u0027s address. Do not hash.",
                        "valueHint": "US",
                        "valueValidators": []
                      },
                      {
                        "type": "TEXT",
                        "name": "userDataAddressPostalCode",
                        "displayName": "User Address Postal Code",
                        "simpleValueType": true,
                        "help": "The postal code of the user\u0027s address. Do not hash.\n\u003cbr/\u003e\nBoth US and international zip and postal codes are allowed. \n\u003cbr/\u003e\nFor US addresses, use either 5 digits or 5 digits followed by a 4-digit extension. Using a 4-digit extension may improve your match rate.\n\u003cbr/\u003e\nFor all other countries, don\u0027t use postal code extensions.",
                        "valueHint": "10001",
                        "valueValidators": []
                      }
                    ],
                    "enablingConditions": [
                      {
                        "paramName": "addUserDataAddress",
                        "paramValue": true,
                        "type": "EQUALS"
                      }
                    ],
                    "groupStyle": "NO_ZIPPY"
                  }
                ]
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "adIdentifiersGroup",
            "displayName": "Ad Identifiers",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "SELECT",
                "name": "autoMapAdIdentifiersClickIds",
                "displayName": "Auto-map Click IDs",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": true,
                    "displayValue": "true"
                  },
                  {
                    "value": false,
                    "displayValue": "false"
                  }
                ],
                "simpleValueType": true,
                "help": "If enabled, the tag will attempt to automatically map the \u003ci\u003egclid\u003c/i\u003e, \u003ci\u003egbraid\u003c/i\u003e and \u003ci\u003ewbraid\u003c/i\u003e values using the following sources (in order):\n\u003cul\u003e\n\u003cli\u003eEvent Data\u003c/li\u003e\n\u003cli\u003eURL Parameter\u003c/li\u003e\n\u003cli\u003eServer Cookie\u003c/li\u003e\n\u003cli\u003eJavaScript Cookie\u003c/li\u003e\n\u003c/ul\u003e\n\u003cbr/\u003e\nAny value you manually enter in a field below will always override the auto-mapped value.\n\u003cbr/\u003e\u003cbr/\u003e\n⚠️ Note that this feature might break if Google changes the format of the cookie values. Waster will do its best to keep up with the changes. \n\u003cbr/\u003e\u003cbr/\u003e\nDefault mappings:\n\u003cul\u003e\n  \u003cli\u003egclid:\n    \u003cul\u003e\n      \u003cli\u003e\u003ci\u003egclid\u003c/i\u003e Event Data value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003egclid\u003c/i\u003e URL Parameter value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003eFPGCLAW\u003c/i\u003e Event Data value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003eFPGCLAW\u003c/i\u003e Common Cookie value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003eFPGCLAW\u003c/i\u003e Server Cookie value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003e_gcl_aw\u003c/i\u003e Event Data value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003egcl_aw\u003c/i\u003e Event Data value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003e_gcl_aw\u003c/i\u003e Common Cookie value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003e_gcl_aw\u003c/i\u003e JavaScript cookie value\u003c/li\u003e\n    \u003c/ul\u003e\n  \u003c/li\u003e\n  \u003cli\u003egbraid:\n    \u003cul\u003e\n      \u003cli\u003e\u003ci\u003egbraid\u003c/i\u003e Event Data value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003egbraid\u003c/i\u003e URL Parameter value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003eFPGCLAG\u003c/i\u003e Event Data value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003eFPGCLAG\u003c/i\u003e Common Cookie value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003eFPGCLAG\u003c/i\u003e Server Cookie value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003e_gcl_ag\u003c/i\u003e Event Data value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003egcl_ag\u003c/i\u003e Event Data value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003e_gcl_ag\u003c/i\u003e Common Cookie value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003e_gcl_ag\u003c/i\u003e JavaScript cookie value\u003c/li\u003e\n    \u003c/ul\u003e\n  \u003c/li\u003e\n  \u003cli\u003ewbraid:\n    \u003cul\u003e\n      \u003cli\u003e\u003ci\u003ewbraid\u003c/i\u003e Event Data value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003ewbraid\u003c/i\u003e URL Parameter value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003eFPGCLGB\u003c/i\u003e Event Data value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003eFPGCLGB\u003c/i\u003e Common Cookie value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003eFPGCLGB\u003c/i\u003e Server Cookie value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003e_gcl_gb\u003c/i\u003e Event Data value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003egcl_gb\u003c/i\u003e Event Data value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003e_gcl_gb\u003c/i\u003e Common Cookie value\u003c/li\u003e\n      \u003cli\u003e\u003ci\u003e_gcl_gb\u003c/i\u003e JavaScript cookie value\u003c/li\u003e\n    \u003c/ul\u003e\n  \u003c/li\u003e\n\u003c/ul\u003e",
                "defaultValue": false
              },
              {
                "type": "TEXT",
                "name": "adIdentifiersGclid",
                "displayName": "gclid",
                "simpleValueType": true,
                "help": "The Google Click ID (\u003ci\u003egclid\u003c/i\u003e) associated with this event."
              },
              {
                "type": "TEXT",
                "name": "adIdentifiersGbraid",
                "displayName": "gbraid",
                "simpleValueType": true,
                "help": "The click identifier for clicks associated with app events and originating from iOS devices starting with iOS14."
              },
              {
                "type": "TEXT",
                "name": "adIdentifiersWbraid",
                "displayName": "wbraid",
                "simpleValueType": true,
                "help": "The click identifier for clicks associated with web events and originating from iOS devices starting with iOS14."
              },
              {
                "type": "TEXT",
                "name": "adIdentifiersLandingPageDeviceInfoUserAgent",
                "displayName": "Landing Page User Agent",
                "simpleValueType": true,
                "help": "Information gathered about the device\u0027s user agent being used (if any) at the time of landing onto the advertiser’s site after interacting with the ad."
              },
              {
                "type": "TEXT",
                "name": "adIdentifiersLandingPageDeviceInfoIpAddress",
                "displayName": "Landing Page IP Address",
                "simpleValueType": true,
                "help": "Information gathered about the device\u0027s IP address being used (if any) at the time of landing onto the advertiser’s site after interacting with the ad.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003eNote:\u003c/b\u003e Google Ads does not support IP address matching for end users in the European Economic Area (EEA), United Kingdom (UK), or Switzerland (CH). Add logic to conditionally exclude sharing IP addresses from users from these regions and ensure that you provide users with clear and comprehensive information about the data you collect on your sites, apps, and other properties and get consent where required by law or any applicable Google policies. See the \u003ca href\u003d\"https://support.google.com/google-ads/answer/2998031\"\u003eAbout offline conversion imports page\u003c/a\u003e for more details."
              },
              {
                "type": "SELECT",
                "name": "autoMapAdIdentifiersSessionAttributes",
                "displayName": "Auto-map Session Attributes",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": true,
                    "displayValue": "true"
                  },
                  {
                    "value": false,
                    "displayValue": "false"
                  }
                ],
                "simpleValueType": true,
                "help": "If enabled, the tag will attempt to automatically map the \u003ci\u003eSession Attributes\u003c/i\u003e from, in this order: \n\u003cul\u003e\n\u003cli\u003e\u003ci\u003esession_attributes\u003c/i\u003e Event Data value\u003c/li\u003e\n\u003cli\u003e \u003ci\u003e_dm_session_attributes\u003c/i\u003e Common Cookie value \u003c/li\u003e \n\u003cli\u003e\u003ci\u003e_dm_session_attributes\u003c/i\u003e cookie set by the Pageview event\u003c/li\u003e\n\u003c/ul\u003e\n\u003cbr/\u003e\nAny value you manually enter in a field below will always override the auto-mapped value.\n\u003cbr/\u003e\u003cbr/\u003e\nDefault mappings:\n\u003cul\u003e\n\u003cli\u003eSession Attribute \u003ci\u003egad_source\u003c/i\u003e: \u003ci\u003egad_source\u003c/i\u003e URL Parameter value \u003c/li\u003e\n\u003cli\u003eSession Attribute \u003ci\u003egad_campaignid\u003c/i\u003e: \u003ci\u003egad_campaignid\u003c/i\u003e URL Parameter value\u003c/li\u003e\n\u003cli\u003eSession Attribute \u003ci\u003elanding_page_url\u003c/i\u003e: \u003ci\u003epage_location\u003c/i\u003e Event Data value\u003c/li\u003e\n\u003cli\u003eSession Attribute \u003ci\u003elanding_page_referrer\u003c/i\u003e: \u003ci\u003epage_referrer\u003c/i\u003e Event Data value\u003c/li\u003e\u003c/li\u003e\n\u003cli\u003eSession Attribute \u003ci\u003elanding_page_user_agent\u003c/i\u003e: \u003ci\u003euser_agent\u003c/i\u003e Event Data value\u003c/li\u003e\u003c/li\u003e\n\u003cli\u003eSession Attribute \u003ci\u003esession_start_time_usec\u003c/i\u003e: current timestamp of the time when the Pageview tag set the cookie\u003c/li\u003e\n\u003c/ul\u003e\n\u003cbr/\u003e\nLearn more: \u003ca href\u003d\"https://support.google.com/google-ads/answer/16194756?hl\u003den\"\u003e[1]\u003c/a\u003e and \u003ca href\u003d\"https://ads-developers.googleblog.com/2025/08/maximize-performance-of-your-google-ads.html\"\u003e[2]\u003c/a\u003e.",
                "defaultValue": false
              },
              {
                "type": "TEXT",
                "name": "adIdentifiersSessionAttributes",
                "displayName": "Session Attributes String",
                "simpleValueType": true,
                "help": "Session attributes string for conversion event attribution and modeling.\n\u003cbr/\u003e\nLearn more: \u003ca href\u003d\"https://support.google.com/google-ads/answer/16194756?hl\u003den\"\u003e[1]\u003c/a\u003e and \u003ca href\u003d\"https://ads-developers.googleblog.com/2025/08/maximize-performance-of-your-google-ads.html\"\u003e[2]\u003c/a\u003e."
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "eventDeviceInfoGroup",
            "displayName": "Event Device Information",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "SELECT",
                "name": "autoMapEventDeviceInfo",
                "displayName": "Auto-map Event Device Information",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": true,
                    "displayValue": "true"
                  },
                  {
                    "value": false,
                    "displayValue": "false"
                  }
                ],
                "simpleValueType": true,
                "help": "If enabled, the tag will attempt to automatically map parameters from the Event Data.\n\u003cbr/\u003e\u003cbr/\u003e\nAny value you manually enter in a field below will always override the auto-mapped value.\n\u003cbr/\u003e\u003cbr/\u003e\nDefault mappings:\n\u003cul\u003e\n\u003cli\u003eUser Agent: \u003ci\u003eeventData.user_agent\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003eIP Address: \u003ci\u003eeventData.ip_override\u003c/i\u003e\u003c/li\u003e\n\u003c/ul\u003e",
                "defaultValue": true
              },
              {
                "type": "TEXT",
                "name": "eventDeviceInfoUserAgent",
                "displayName": "User Agent",
                "simpleValueType": true,
                "help": "Information gathered about the device\u0027s user agent being used (if any) when the event happened."
              },
              {
                "type": "TEXT",
                "name": "eventDeviceInfoIpAddress",
                "displayName": "IP Address",
                "simpleValueType": true,
                "help": "Information gathered about the device\u0027s IP address being used (if any) when the event happened.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003cb\u003eNote:\u003c/b\u003e Google Ads does not support IP address matching for end users in the European Economic Area (EEA), United Kingdom (UK), or Switzerland (CH). Add logic to conditionally exclude sharing IP addresses from users from these regions and ensure that you provide users with clear and comprehensive information about the data you collect on your sites, apps, and other properties and get consent where required by law or any applicable Google policies. See the \u003ca href\u003d\"https://support.google.com/google-ads/answer/2998031\"\u003eAbout offline conversion imports page\u003c/a\u003e for more details."
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "userPropertiesGroup",
            "displayName": "User Properties",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "SELECT",
                "name": "userPropertiesCustomerType",
                "displayName": "Customer Type",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": "NEW",
                    "displayValue": "NEW"
                  },
                  {
                    "value": "RETURNING",
                    "displayValue": "RETURNING"
                  },
                  {
                    "value": "REENGAGED",
                    "displayValue": "REENGAGED"
                  }
                ],
                "simpleValueType": true,
                "help": "Type of the customer associated with the event.",
                "notSetText": "(not set)"
              },
              {
                "type": "SELECT",
                "name": "userPropertiesCustomerValueBucket",
                "displayName": "Customer Value Bucket",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": "LOW",
                    "displayValue": "LOW"
                  },
                  {
                    "value": "MEDIUM",
                    "displayValue": "MEDIUM"
                  },
                  {
                    "value": "HIGH",
                    "displayValue": "HIGH"
                  }
                ],
                "simpleValueType": true,
                "help": "The advertiser-assessed value of the customer.",
                "notSetText": "(not set)"
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "cartDataGroup",
            "displayName": "Cart Data",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "SELECT",
                "name": "autoMapCartData",
                "displayName": "Auto-map Cart Data",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": true,
                    "displayValue": "true"
                  },
                  {
                    "value": false,
                    "displayValue": "false"
                  }
                ],
                "simpleValueType": true,
                "help": "If enabled, the tag will attempt to automatically map parameters from the Event Data.\n\u003cbr/\u003e\u003cbr/\u003e\nAny value you manually enter in a field below will always override the auto-mapped value.\n\u003cbr/\u003e\u003cbr/\u003e\nDefault mappings:\n\u003cul\u003e\n\u003cli\u003eItems: \u003ci\u003eeventData.items\u003c/i\u003e\u003c/li\u003e\n\u003c/ul\u003e",
                "defaultValue": true,
                "subParams": [
                  {
                    "type": "TEXT",
                    "name": "itemIdKey",
                    "displayName": "Custom Item ID Key",
                    "simpleValueType": true,
                    "help": "Optional. \u003cbr/\u003e\u003cbr/\u003e You can specify a custom key, which will be used to set the content Item ID, by default \u003ci\u003eitem_id\u003c/i\u003e will be used. This may be useful if you are using WooCommerce extensions.",
                    "enablingConditions": [
                      {
                        "paramName": "autoMapCartData",
                        "paramValue": false,
                        "type": "NOT_EQUALS"
                      }
                    ]
                  }
                ]
              },
              {
                "type": "TEXT",
                "name": "cartDataMerchantId",
                "displayName": "Merchant Center ID",
                "simpleValueType": true,
                "help": "The Merchant Center ID associated with the items.\n\u003cbr/\u003e\u003cbr/\u003e\n\u003ca href\u003d\"https://support.google.com/paymentscenter/answer/7163092?hl\u003den\"\u003eLearn more\u003c/a\u003e."
              },
              {
                "type": "TEXT",
                "name": "cartDataMerchantFeedLabel",
                "displayName": "Merchant Center Feed Label",
                "simpleValueType": true,
                "help": "The Merchant Center feed label associated with the feed of the items.\n\u003cbr/\u003e\u003cbr/\u003e\nYou can find it as a URL parameter in the Merchant Center URL:  \u003ci\u003efeedLabel\u003d\u003cb\u003eDK\u003c/b\u003e\u003c/i\u003e."
              },
              {
                "type": "TEXT",
                "name": "cartDataMerchantFeedLanguageCode",
                "displayName": "Merchant Center Feed Language Code",
                "simpleValueType": true,
                "help": "The language code in ISO 639-1 associated with the Merchant Center feed of the items.where your items are uploaded.\n\u003cbr/\u003e\u003cbr/\u003e\nYou can find it as a URL parameter in the Merchant Center URL: \u003ci\u003elanguage\u003d\u003cb\u003eda\u003c/b\u003e\u003c/i\u003e."
              },
              {
                "type": "TEXT",
                "name": "cartDataTransactionDiscount",
                "displayName": "Transaction Discount",
                "simpleValueType": true,
                "help": "The sum of all discounts associated with the transaction/conversion."
              },
              {
                "type": "TEXT",
                "name": "cartDataItems",
                "displayName": "Items",
                "simpleValueType": true,
                "help": "The list of items associated with the event. Each item is an object in the list with the following properties: \u003ci\u003eitemId\u003c/i\u003e, \u003ci\u003emerchantProductId\u003c/i\u003e, \u003ci\u003equantity\u003c/i\u003e and \u003ci\u003eunitPrice\u003c/i\u003e.\n\u003cbr/\u003e\n\u003ca href\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#item\"\u003eLearn more\u003c/a\u003e."
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "customVariablesGroup",
            "displayName": "Custom Variables",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "LABEL",
                "name": "customVariablesGroupLabel",
                "displayName": "\u003ca href\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#customvariable\"\u003eLearn more\u003c/a\u003e about Custom Variables.\n\u003cbr/\u003e\n\u003ca href\u003d\"https://github.com/stape-io/google-conversion-events-tag?tab\u003dreadme-ov-file#how-to-obtain-the-variable-id\"\u003eLearn more\u003c/a\u003e about how to obtain the \u003ci\u003eCustom Variable ID\u003c/i\u003e.\n\u003cbr/\u003e\nIn the optional \u003ci\u003eDestination References\u003c/i\u003e column, you may leave it blank, or specify either a single reference or an array of references.\n\u003cbr/\u003e\u003cbr/\u003e"
              },
              {
                "type": "SIMPLE_TABLE",
                "name": "customVariablesList",
                "simpleTableColumns": [
                  {
                    "defaultValue": "",
                    "displayName": "Custom Variable ID",
                    "name": "name",
                    "type": "TEXT",
                    "isUnique": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      },
                      {
                        "type": "POSITIVE_NUMBER"
                      }
                    ],
                    "valueHint": "123456"
                  },
                  {
                    "defaultValue": "",
                    "displayName": "Custom Variable Value",
                    "name": "value",
                    "type": "TEXT",
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  },
                  {
                    "defaultValue": "",
                    "displayName": "Destination References",
                    "name": "destinationReferences",
                    "type": "TEXT"
                  }
                ],
                "newRowButtonText": "Add Custom Variable"
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "experimentalFieldsGroup",
            "displayName": "Experimental Fields",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "LABEL",
                "name": "experimentalFieldsGroupLabel",
                "displayName": "\u003ca href\u003d\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#experimentalfield\"\u003eLearn more\u003c/a\u003e about Experimental Fields.\n\u003cbr/\u003e\u003cbr/\u003e"
              },
              {
                "type": "SIMPLE_TABLE",
                "name": "experimentalFieldsList",
                "displayName": "",
                "simpleTableColumns": [
                  {
                    "defaultValue": "",
                    "displayName": "Field Name",
                    "name": "name",
                    "type": "TEXT",
                    "isUnique": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  },
                  {
                    "defaultValue": "",
                    "displayName": "Field Value",
                    "name": "value",
                    "type": "TEXT",
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  }
                ],
                "newRowButtonText": "Add Field"
              }
            ]
          }
        ],
        "enablingConditions": [
          {
            "paramName": "conversionEventMode",
            "paramValue": "single",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "GROUP",
        "name": "ownConnectionSettings",
        "displayName": "Own Connection Settings",
        "groupStyle": "ZIPPY_CLOSED",
        "subParams": [
          {
            "type": "TEXT",
            "name": "xGoogUserProject",
            "displayName": "X-Goog-User-Project header",
            "simpleValueType": true,
            "help": "A request header that specifies the GCP project to bill for access charges associated with the request.\n\u003ca href\u003d\"https://docs.cloud.google.com/storage/docs/json_api/v1/parameters#xgooguserproject\"\u003eLearn more.\u003c/a\u003e"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "authFlow",
            "paramValue": "own",
            "type": "EQUALS"
          }
        ]
      }
    ],
    "enablingConditions": [
      {
        "paramName": "eventType",
        "paramValue": "pageview",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "tagExecutionConsentSettingsGroup",
    "displayName": "Tag Execution Consent Settings",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "RADIO",
        "name": "adStorageConsent",
        "displayName": "",
        "radioItems": [
          {
            "value": "optional",
            "displayValue": "Send data always"
          },
          {
            "value": "required",
            "displayValue": "Send data in case marketing consent given",
            "help": "Aborts the tag execution if marketing consent (\u003ci\u003ead_storage\u003c/i\u003e Google Consent Mode or Waster\u0027s Data Tag parameter) is not given."
          }
        ],
        "simpleValueType": true,
        "defaultValue": "optional"
      }
    ]
  },
  {
    "displayName": "Logs Settings",
    "name": "logsGroup",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "type": "RADIO",
        "name": "logType",
        "radioItems": [
          {
            "value": "no",
            "displayValue": "Do not log"
          },
          {
            "value": "debug",
            "displayValue": "Log to console during debug and preview"
          },
          {
            "value": "always",
            "displayValue": "Always log to console"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "debug"
      }
    ],
    "enablingConditions": [
      {
        "paramName": "eventType",
        "paramValue": "pageview",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "displayName": "BigQuery Logs Settings",
    "name": "bigQueryLogsGroup",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "type": "RADIO",
        "name": "bigQueryLogType",
        "radioItems": [
          {
            "value": "no",
            "displayValue": "Do not log to BigQuery"
          },
          {
            "value": "always",
            "displayValue": "Log to BigQuery"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "no"
      },
      {
        "type": "GROUP",
        "name": "logsBigQueryConfigGroup",
        "groupStyle": "NO_ZIPPY",
        "subParams": [
          {
            "type": "TEXT",
            "name": "logBigQueryProjectId",
            "displayName": "BigQuery Project ID",
            "simpleValueType": true,
            "help": "Optional.  \u003cbr\u003e\u003cbr\u003e  If omitted, it will be retrieved from the environment variable \u003cI\u003eGOOGLE_CLOUD_PROJECT\u003c/i\u003e where the server container is running. If the server container is running on Google Cloud, \u003cI\u003eGOOGLE_CLOUD_PROJECT\u003c/i\u003e will already be set to the Google Cloud project\u0027s ID."
          },
          {
            "type": "TEXT",
            "name": "logBigQueryDatasetId",
            "displayName": "BigQuery Dataset ID",
            "simpleValueType": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          },
          {
            "type": "TEXT",
            "name": "logBigQueryTableId",
            "displayName": "BigQuery Table ID",
            "simpleValueType": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "enablingConditions": [
          {
            "paramName": "bigQueryLogType",
            "paramValue": "always",
            "type": "EQUALS"
          }
        ]
      }
    ],
    "enablingConditions": [
      {
        "paramName": "eventType",
        "paramValue": "pageview",
        "type": "NOT_EQUALS"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const BigQuery = require('BigQuery');
const computeEffectiveTldPlusOne = require('computeEffectiveTldPlusOne');
const createRegex = require('createRegex');
const encodeUriComponent = require('encodeUriComponent');
const getAllEventData = require('getAllEventData');
const getContainerVersion = require('getContainerVersion');
const getCookieValues = require('getCookieValues');
const getEventData = require('getEventData');
const getGoogleAuth = require('getGoogleAuth');
const getRequestHeader = require('getRequestHeader');
const getTimestampMillis = require('getTimestampMillis');
const getType = require('getType');
const JSON = require('JSON');
const logToConsole = require('logToConsole');
const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const Math = require('Math');
const parseUrl = require('parseUrl');
const Object = require('Object');
const sendHttpRequest = require('sendHttpRequest');
const setCookie = require('setCookie');
const sha256Sync = require('sha256Sync');
const toBase64 = require('toBase64');

/*==============================================================================
==============================================================================*/

const apiVersion = '1';
const eventData = getAllEventData();
const useOptimisticScenario = isUIFieldTrue(data.useOptimisticScenario);

if (shouldExitEarly(data, eventData)) {
  return data.gtmOnSuccess();
}

const actionHandlers = {
  pageview: handlePageViewEvent,
  conversion: handleConversionEvent
};

const handler = actionHandlers[data.eventType || 'conversion'];
if (handler) {
  const error = handler(data, eventData);
  if (error) return;
} else {
  return data.gtmOnFailure();
}

if (useOptimisticScenario) {
  return data.gtmOnSuccess();
}

/*==============================================================================
  Vendor related functions
==============================================================================*/

function createSessionAttributesBase64String(sessionAttributes) {
  let sessionAttributesBase64 = toBase64(JSON.stringify(sessionAttributes));

  // Attempt to reduce the payload size if it exceeds the 4000-character limit.
  const keysToRemove = ['landing_page_referrer', 'landing_page_user_agent'];
  for (const key of keysToRemove) {
    if (sessionAttributesBase64.length <= 4000) break;
    sessionAttributes[key] = undefined;
    sessionAttributesBase64 = toBase64(JSON.stringify(sessionAttributes));
  }
  if (sessionAttributesBase64.length > 4000) return;

  const plusSignRegex = createRegex('\\+', 'g');
  const forwardSlashRegex = createRegex('\\/', 'g');
  const equalSignSuffixRegex = createRegex('=+$', 'g');
  return sessionAttributesBase64
    .replace(plusSignRegex, '-')
    .replace(forwardSlashRegex, '_')
    .replace(equalSignSuffixRegex, '');
}

function handlePageViewEvent(data, eventData) {
  const url = getUrl(eventData);
  if (!url) {
    data.gtmOnSuccess();
    return;
  }

  // Ref: https://support.google.com/google-ads/answer/16194756

  const urlSearchParams = parseUrl(url).searchParams;
  const urlSearchParamsKeys = Object.keys(urlSearchParams);
  const hasAdsParams = urlSearchParamsKeys.some((key) => {
    return (
      (key.indexOf('gad_') === 0 || key === 'gclid' || key === 'gbraid') && urlSearchParams[key]
    );
  });

  if (!hasAdsParams) {
    data.gtmOnSuccess();
    return;
  }

  const sessionAttributes = {};
  urlSearchParamsKeys.forEach((key) => {
    if (key.indexOf('gad_') === 0) sessionAttributes[key] = urlSearchParams[key];
  });
  sessionAttributes.session_start_time_usec = makeString(getTimestampMillis() * 1000);
  if (eventData.page_location) sessionAttributes.landing_page_url = eventData.page_location;
  if (eventData.page_referrer) sessionAttributes.landing_page_referrer = eventData.page_referrer;
  if (eventData.user_agent) sessionAttributes.landing_page_user_agent = eventData.user_agent;

  let sessionAttributesBase64 = createSessionAttributesBase64String(sessionAttributes);
  if (!sessionAttributesBase64) {
    log({
      Name: 'GoogleConversionEvent',
      Type: 'Message',
      EventName: 'PageviewEvent',
      Message: 'Cookie was not set.',
      Reason: 'Session attributes base64 cookie is bigger than 4000 characters.'
    });
    data.gtmOnFailure();
    return true;
  }

  const cookieOptions = {
    domain: getCookieDomain(data),
    samesite: data.cookieSameSite || 'none',
    path: '/',
    secure: true,
    httpOnly: !!data.cookieHttpOnly,
    'max-age': 60 * 60 * 24 * (makeInteger(data.cookieExpiration) || 90)
  };
  setCookie('_dm_session_attributes', sessionAttributesBase64, cookieOptions, false);

  data.gtmOnSuccess();
  return;
}

function addDestinationsData(data, mappedData) {
  const normalizeIds = (id) => {
    return replaceAll(makeString(id), '[^0-9]', '');
  };

  const destinations = [];
  const accountsAndDestinationsFromUI =
    data.wasterAuthDestinationsList || data.ownAuthDestinationsList; // Mutually exclusive.

  accountsAndDestinationsFromUI.forEach((row) => {
    const productDestinationId = normalizeIds(row.productDestinationId);
    const destination = {
      reference: productDestinationId,
      productDestinationId: productDestinationId,
      operatingAccount: {
        accountType: row.product,
        accountId: normalizeIds(row.operatingAccountId)
      }
    };

    // linkedAccount is for data partners; with the advertiser's own OAuth
    // (Wascer flow) Google rejects it with INVALID_DESTINATION.
    if (row.loginAccountId) {
      destination.loginAccount = {
        accountType: row.product,
        accountId: normalizeIds(row.loginAccountId)
      };
    }

    destinations.push(destination);
  });

  mappedData.destinations = destinations;

  return mappedData;
}

function addConsentData(data, mappedData) {
  const consent = {};
  const consentTypes = ['adUserData', 'adPersonalization'];

  consentTypes.forEach((consentType) => {
    if (!data[consentType]) return;
    // Case-insensitive: the legacy template sent GRANTED/DENIED.
    switch (makeString(data[consentType]).toUpperCase()) {
      case 'CONSENT_GRANTED':
      case 'TRUE':
      case 'GRANTED':
        consent[consentType] = 'CONSENT_GRANTED';
        break;
      case 'CONSENT_DENIED':
      case 'FALSE':
      case 'DENIED':
        consent[consentType] = 'CONSENT_DENIED';
        break;
      case 'CONSENT_STATUS_UNSPECIFIED':
        consent[consentType] = 'CONSENT_STATUS_UNSPECIFIED';
        break;
      default:
        return;
    }
    mappedData.consent = consent;
  });

  return mappedData;
}

function getEmailAddressesFromEventData(eventData) {
  const eventDataUserData = eventData.user_data || {};

  let email =
    eventDataUserData.email ||
    eventDataUserData.email_address ||
    eventDataUserData.sha256_email ||
    eventDataUserData.sha256_email_address;

  const emailType = getType(email);

  if (emailType === 'string') email = [email];
  else if (emailType === 'array') email = email.length > 0 ? email : undefined;
  else if (emailType === 'object') {
    const emailsFromObject = Object.values(email);
    if (emailsFromObject.length) email = emailsFromObject;
  }

  return email;
}

function getPhoneNumbersFromEventData(eventData) {
  const eventDataUserData = eventData.user_data || {};

  let phone =
    eventDataUserData.phone ||
    eventDataUserData.phone_number ||
    eventDataUserData.sha256_phone_number;

  const phoneType = getType(phone);

  if (phoneType === 'string') phone = [phone];
  else if (phoneType === 'array') phone = phone.length > 0 ? phone : undefined;
  else if (phoneType === 'object') {
    const phonesFromObject = Object.values(phone);
    if (phonesFromObject.length) phone = phonesFromObject;
  }

  return phone;
}

function getAddressFromEventData(eventData) {
  const eventDataUserData = eventData.user_data || {};
  let eventDataUserDataAddress = {};
  const addressType = getType(eventDataUserData.address);
  if (addressType === 'object' || addressType === 'array') {
    eventDataUserDataAddress = eventDataUserData.address[0] || eventDataUserData.address;
  }

  const firstName =
    eventDataUserDataAddress.first_name || eventDataUserDataAddress.sha256_first_name;
  const lastName = eventDataUserDataAddress.last_name || eventDataUserDataAddress.sha256_last_name;
  const postalCode = eventDataUserDataAddress.postal_code;
  const regionCode = eventDataUserDataAddress.country;

  if (firstName && lastName && postalCode && regionCode) {
    return {
      givenName: makeString(firstName),
      familyName: makeString(lastName),
      postalCode: makeString(postalCode),
      regionCode: makeString(regionCode)
    };
  }
}

function addConversionInformation(data, eventData, conversionEvent) {
  const getValueFromItems = (eventData) => {
    if (getType(eventData.items) !== 'array' || eventData.items.length === 0) return;

    let valueFromItems = 0;
    eventData.items.forEach((i) => {
      if (!isValidValue(i.price)) return;
      const itemPrice = makeNumber(i.price);
      const itemQuantity = makeInteger(i.quantity);
      valueFromItems += itemQuantity ? itemQuantity * itemPrice : itemPrice;
    });

    return valueFromItems;
  };

  if (isUIFieldTrue(data.autoMapConversionInformation)) {
    if (eventData.transaction_id) {
      conversionEvent.transactionId = makeString(eventData.transaction_id);
    }

    if (eventData.currency) conversionEvent.currency = eventData.currency;

    const conversionValue = eventData.value || getValueFromItems(eventData);
    if (isValidValue(conversionValue)) conversionEvent.conversionValue = conversionValue;
  }

  if (data.transactionId) conversionEvent.transactionId = makeString(data.transactionId);

  if (data.eventTimestamp) {
    conversionEvent.eventTimestamp = getConversionDateTime(data.eventTimestamp);
  } else conversionEvent.eventTimestamp = getConversionDateTime();

  if (data.lastUpdatedTimestamp) {
    conversionEvent.lastUpdatedTimestamp = getConversionDateTime(data.lastUpdatedTimestamp);
  }

  if (data.currency) conversionEvent.currency = data.currency;

  if (isValidValue(data.conversionValue)) {
    conversionEvent.conversionValue = makeNumber(data.conversionValue);
  }

  if (data.eventSource) conversionEvent.eventSource = data.eventSource;

  return conversionEvent;
}

function addUserData(data, eventData, conversionEvent) {
  const itemizeUserIdentifier = (input) => {
    const type = getType(input);
    if (type === 'array') return input.filter((e) => e);
    if (type === 'string' || type === 'number') return [input];
    return [];
  };
  const userDataIDsLengthLimit = 10;

  let emailAddresses;
  let phoneNumbers;
  let address;

  if (isUIFieldTrue(data.autoMapUserData)) {
    emailAddresses = getEmailAddressesFromEventData(eventData);
    phoneNumbers = getPhoneNumbersFromEventData(eventData);
    address = getAddressFromEventData(eventData);
  }

  if (data.userDataEmailAddresses) emailAddresses = data.userDataEmailAddresses;
  if (data.userDataPhoneNumbers) phoneNumbers = data.userDataPhoneNumbers;
  if (data.addUserDataAddress) {
    const addressUIFields = [
      'userDataAddressGivenName',
      'userDataAddressFamilyName',
      'userDataAddressRegion',
      'userDataAddressPostalCode'
    ];
    const inputAllAddressFieldsAreValid = addressUIFields.every((p) => isValidValue(data[p]));

    if (inputAllAddressFieldsAreValid) {
      address = {
        givenName: makeString(data.userDataAddressGivenName),
        familyName: makeString(data.userDataAddressFamilyName),
        regionCode: makeString(data.userDataAddressRegion),
        postalCode: makeString(data.userDataAddressPostalCode)
      };
    }
  }

  if (emailAddresses || phoneNumbers || address) {
    const userIdentifiers = [];

    if (emailAddresses) {
      emailAddresses = itemizeUserIdentifier(emailAddresses);
      if (emailAddresses.length) {
        emailAddresses.forEach((email) => userIdentifiers.push({ emailAddress: email }));
      }
    }

    if (phoneNumbers) {
      phoneNumbers = itemizeUserIdentifier(phoneNumbers);
      if (phoneNumbers.length) {
        phoneNumbers.forEach((phone) => userIdentifiers.push({ phoneNumber: phone }));
      }
    }

    if (address) {
      userIdentifiers.push({
        address: address
      });
    }

    if (userIdentifiers.length > 0) {
      conversionEvent.userData = {
        userIdentifiers: userIdentifiers.slice(0, userDataIDsLengthLimit)
      };
    }
  }

  return conversionEvent;
}

function addAdIdentifiers(data, eventData, conversionEvent) {
  const adIdentifiers = {};

  if (isUIFieldTrue(data.autoMapAdIdentifiersClickIds)) {
    const clickIds = getClickIds(eventData);
    if (clickIds.gclid) adIdentifiers.gclid = clickIds.gclid;
    if (clickIds.gbraid) adIdentifiers.gbraid = clickIds.gbraid;
    if (clickIds.wbraid) adIdentifiers.wbraid = clickIds.wbraid;
  }

  if (data.adIdentifiersGclid) adIdentifiers.gclid = data.adIdentifiersGclid;
  if (data.adIdentifiersGbraid) adIdentifiers.gbraid = data.adIdentifiersGbraid;
  if (data.adIdentifiersWbraid) adIdentifiers.wbraid = data.adIdentifiersWbraid;

  if (isUIFieldTrue(data.autoMapAdIdentifiersSessionAttributes)) {
    const commonCookie = eventData.common_cookie || {};
    const sessionAttributes =
      eventData.session_attributes ||
      commonCookie._dm_session_attributes ||
      getCookieValues('_dm_session_attributes')[0];
    if (sessionAttributes) adIdentifiers.sessionAttributes = sessionAttributes;
  }

  if (data.adIdentifiersLandingPageDeviceInfoUserAgent) {
    adIdentifiers.landingPageDeviceInfo = adIdentifiers.landingPageDeviceInfo || {};
    adIdentifiers.landingPageDeviceInfo.userAgent =
      data.adIdentifiersLandingPageDeviceInfoUserAgent;
  }
  if (data.adIdentifiersLandingPageDeviceInfoIpAddress) {
    adIdentifiers.landingPageDeviceInfo = adIdentifiers.landingPageDeviceInfo || {};
    adIdentifiers.landingPageDeviceInfo.ipAddress =
      data.adIdentifiersLandingPageDeviceInfoIpAddress;
  }

  if (data.adIdentifiersSessionAttributes) {
    adIdentifiers.sessionAttributes = data.adIdentifiersSessionAttributes;
  }

  if (hasProps(adIdentifiers)) conversionEvent.adIdentifiers = adIdentifiers;

  return conversionEvent;
}

function addEventDeviceInformation(data, eventData, conversionEvent) {
  const eventDeviceInfo = {};

  if (isUIFieldTrue(data.autoMapEventDeviceInfo)) {
    if (eventData.user_agent) eventDeviceInfo.userAgent = eventData.user_agent;
    if (eventData.ip_override) eventDeviceInfo.ipAddress = eventData.ip_override;
  }

  if (data.eventDeviceInfoUserAgent) eventDeviceInfo.userAgent = data.eventDeviceInfoUserAgent;
  if (data.eventDeviceInfoIpAddress) eventDeviceInfo.ipAddress = data.eventDeviceInfoIpAddress;

  if (hasProps(eventDeviceInfo)) conversionEvent.eventDeviceInfo = eventDeviceInfo;

  return conversionEvent;
}

function addUserProperties(data, conversionEvent) {
  const userProperties = {};

  if (data.userPropertiesCustomerType) {
    userProperties.customerType = data.userPropertiesCustomerType;
  }

  if (data.userPropertiesCustomerValueBucket) {
    userProperties.customerValueBucket = data.userPropertiesCustomerValueBucket;
  }

  if (hasProps(userProperties)) {
    conversionEvent.userProperties = userProperties;
  }

  return conversionEvent;
}

function addCartData(data, eventData, conversionEvent) {
  const cartData = {};

  if (isUIFieldTrue(data.autoMapCartData)) {
    if (getType(eventData.items) === 'array' && eventData.items.length > 0) {
      const itemIdKey = data.itemIdKey ? data.itemIdKey : 'item_id';
      cartData.items = eventData.items.map((i) => {
        const item = {};
        if (i[itemIdKey]) {
          const itemId = makeString(i[itemIdKey]);
          item.merchantProductId = itemId;
          item.itemId = itemId;
        }
        if (i.quantity) item.quantity = makeString(i.quantity);
        if (isValidValue(i.price)) item.unitPrice = makeNumber(i.price);
        return item;
      });
    }
  }

  if (data.cartDataMerchantId) cartData.merchantId = makeString(data.cartDataMerchantId);

  if (data.cartDataMerchantFeedLabel) {
    cartData.merchantFeedLabel = makeString(data.cartDataMerchantFeedLabel);
  }

  if (data.cartDataMerchantFeedLanguageCode) {
    cartData.merchantFeedLanguageCode = makeString(data.cartDataMerchantFeedLanguageCode);
  }

  if (isValidValue(data.cartDataTransactionDiscount)) {
    cartData.transactionDiscount = makeNumber(data.cartDataTransactionDiscount);
  }

  if (getType(data.cartDataItems) === 'array' && data.cartDataItems.length > 0) {
    cartData.items = data.cartDataItems.map((i) => {
      const item = {};
      if (i.merchantProductId) item.merchantProductId = makeString(i.merchantProductId);
      if (i.itemId) item.itemId = makeString(i.itemId);
      if (i.quantity) item.quantity = makeString(i.quantity);
      if (isValidValue(i.unitPrice)) item.unitPrice = makeNumber(i.unitPrice);
      return item;
    });
  }

  if (hasProps(cartData)) conversionEvent.cartData = cartData;

  return conversionEvent;
}

function addCustomVariables(data, conversionEvent) {
  const customVariables = [];

  if (data.customVariablesList) {
    data.customVariablesList.forEach((d) => {
      if (!isValidValue(d.name) || !isValidValue(d.value)) return;

      const customVariable = { variable: makeString(d.name), value: makeString(d.value) };

      if (d.destinationReferences) {
        const destinationReferences = (
          getType(d.destinationReferences) === 'array'
            ? d.destinationReferences
            : [d.destinationReferences]
        )
          .filter((dr) => isValidValue(dr))
          .map((dr) => makeString(dr));

        if (destinationReferences.length) {
          customVariable.destinationReferences = destinationReferences;
        }
      }

      customVariables.push(customVariable);
    });

    if (customVariables.length > 0) conversionEvent.customVariables = customVariables;
  }

  return conversionEvent;
}

function addExperimentalFields(data, conversionEvent) {
  const experimentalFields = [];

  if (data.experimentalFieldsList) {
    data.experimentalFieldsList.forEach((d) => {
      if (!isValidValue(d.value)) return;

      experimentalFields.push({ field: d.name, value: makeString(d.value) });
    });

    if (experimentalFields.length > 0) conversionEvent.experimentalFields = experimentalFields;
  }

  return conversionEvent;
}

function addConversionEventsData(data, eventData, mappedData) {
  if (data.conversionEventMode === 'single') {
    const conversionEvent = {};

    addConversionInformation(data, eventData, conversionEvent);
    addUserData(data, eventData, conversionEvent);
    addAdIdentifiers(data, eventData, conversionEvent);
    addEventDeviceInformation(data, eventData, conversionEvent);
    addUserProperties(data, conversionEvent);
    addCartData(data, eventData, conversionEvent);
    addCustomVariables(data, conversionEvent);
    addExperimentalFields(data, conversionEvent);

    mappedData.events = [conversionEvent];
  } else if (
    data.conversionEventMode === 'multiple' &&
    getType(data.conversionEvents) === 'array' &&
    data.conversionEvents.length > 0
  ) {
    mappedData.events = data.conversionEvents;
  }

  return mappedData;
}

function addEncodingData(data, mappedData) {
  // Avoids overwriting the encoding information if the tag auto-hashed (HEX output) User Data.
  const encoding = mappedData.encoding || data.userDataEncoding;
  if (encoding) mappedData.encoding = encoding;

  return mappedData;
}

function addEncryptionData(data, mappedData) {
  const encryptionInfo = {
    gcpWrappedKeyInfo: {
      keyType: data.gcpWrappedKeyType,
      wipProvider: data.gcpWrappedKeyWipProvider,
      kekUri: data.gcpWrappedKeyKekUri,
      encryptedDek: data.gcpWrappedKeyEncryptedDek
    }
  };

  mappedData.encryptionInfo = encryptionInfo;

  return mappedData;
}

function normalizeEmailAddress(email) {
  if (!email) return email;

  const emailParts = email.split('@');
  if (emailParts[1] === 'gmail.com' || emailParts[1] === 'googlemail.com') {
    return emailParts[0].split('.').join('') + '@' + emailParts[1];
  }
  return emailParts.join('@');
}

function normalizePhoneNumber(phoneNumber) {
  if (!phoneNumber) return phoneNumber;

  phoneNumber = phoneNumber
    .split(' ')
    .join('')
    .split('-')
    .join('')
    .split('(')
    .join('')
    .split(')')
    .join('');
  if (phoneNumber[0] !== '+') phoneNumber = '+' + phoneNumber;
  return phoneNumber;
}

function hashDataIfNeeded(mappedData) {
  const conversionEvents = mappedData.events;

  if (getType(conversionEvents) !== 'array') return;

  conversionEvents.forEach((conversionEvent) => {
    if (
      getType(conversionEvent) !== 'object' ||
      getType(conversionEvent.userData) !== 'object' ||
      getType(conversionEvent.userData.userIdentifiers) !== 'array'
    ) {
      return;
    }

    conversionEvent.userData.userIdentifiers.forEach((userIdentifier) => {
      const key = Object.keys(userIdentifier)[0];

      if (key === 'emailAddress' || key === 'phoneNumber') {
        let value = userIdentifier[key];

        if (!value) return;

        if (isSHA256HexHashed(value)) {
          mappedData.encoding = 'HEX';
          return;
        } else if (isSHA256Base64Hashed(value)) {
          mappedData.encoding = 'BASE64';
          return;
        }

        if (key === 'phoneNumber') value = normalizePhoneNumber(value);
        else if (key === 'emailAddress') value = normalizeEmailAddress(value);

        userIdentifier[key] = hashData(value);
        mappedData.encoding = 'HEX';
      } else if (key === 'address') {
        if (getType(userIdentifier.address) !== 'object') return;

        const addressKeysToHash = ['givenName', 'familyName'];
        addressKeysToHash.forEach((nameKey) => {
          const value = userIdentifier.address[nameKey];
          if (!value) return;

          if (isSHA256HexHashed(value)) {
            mappedData.encoding = 'HEX';
            return;
          } else if (isSHA256Base64Hashed(value)) {
            mappedData.encoding = 'BASE64';
            return;
          }

          userIdentifier.address[nameKey] = hashData(value);
          mappedData.encoding = 'HEX';
        });
      }
    });
  });

  return mappedData;
}

function getClickIds(eventData) {
  const parseClickIdFromCookieValue = (cookieValue, cookieType) => {
    if (getType(cookieValue) !== 'string') return;
    if (cookieType === 'server') {
      const cookieValueMatch = cookieValue.match('\\.k(.+)\\$i');
      return cookieValueMatch ? cookieValueMatch[1] : undefined;
    } else if (cookieType === 'js') {
      const cookieValueSplit = cookieValue.split('.');
      return cookieValueSplit[cookieValueSplit.length - 1];
    }
  };
  const getClickIdValueFromSources = (clickIdName, eventData, urlSearchParams) => {
    const commonCookie = eventData.common_cookie || {};
    const clickIdNameMapping = {
      gclid: { server: 'FPGCLAW', js: '_gcl_aw' },
      gbraid: { server: 'FPGCLAG', js: '_gcl_ag' },
      wbraid: { server: 'FPGCLGB', js: '_gcl_gb' }
    };
    const serverCookieName = clickIdNameMapping[clickIdName].server;
    const jsCookieName = clickIdNameMapping[clickIdName].js;
    return (
      eventData[clickIdName] ||
      urlSearchParams[clickIdName] ||
      parseClickIdFromCookieValue(
        eventData[serverCookieName] ||
          commonCookie[serverCookieName] ||
          getCookieValues(serverCookieName)[0],
        'server'
      ) ||
      parseClickIdFromCookieValue(
        eventData[jsCookieName] ||
          eventData[jsCookieName.substring(1)] ||
          commonCookie[jsCookieName] ||
          getCookieValues(jsCookieName)[0],
        clickIdName === 'gbraid' ? 'server' : 'js' // '_gcl_ag' follows the Server format
      )
    );
  };
  const urlSearchParams = (parseUrl(getUrl(eventData)) || {}).searchParams || {};

  return {
    gclid: getClickIdValueFromSources('gclid', eventData, urlSearchParams),
    gbraid: getClickIdValueFromSources('gbraid', eventData, urlSearchParams),
    wbraid: getClickIdValueFromSources('wbraid', eventData, urlSearchParams)
  };
}

function generateRequestUrl(data, apiVersion) {
  if (data.authFlow === 'own') {
    return 'https://datamanager.googleapis.com/v' + apiVersion + '/events:ingest';
  }

  return 'https://waster.sourei.com.br/google-conversions/events';
}

function generateRequestOptions(data, apiVersion) {
  const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    }
  };

  if (data.authFlow === 'own') {
    const auth = getGoogleAuth({
      scopes: ['https://www.googleapis.com/auth/datamanager']
    });
    options.authorization = auth;
    if (data.xGoogUserProject) options.headers['x-goog-user-project'] = data.xGoogUserProject;
  } else if (data.authFlow === 'waster') {
    options.headers['x-user-id'] = enc(getRequestHeader('x-user-id'));
    var destinationsList = data.wasterAuthDestinationsList;
    if (destinationsList && destinationsList.length > 0) {
      options.headers['x-destination-account-id'] = enc(makeString(destinationsList[0].operatingAccountId));
    }
    options.timeout = 20000;
  }

  return options;
}

function getDataForConversionEventsUpload(data, eventData) {
  const mappedData = {
    validateOnly: isUIFieldTrue(data.validateOnly)
  };

  addDestinationsData(data, mappedData);
  addConsentData(data, mappedData);
  addConversionEventsData(data, eventData, mappedData);
  hashDataIfNeeded(mappedData); // This should come before addEncodingData().
  addEncodingData(data, mappedData);
  if (isUIFieldTrue(data.enableUserDataEncryption)) {
    addEncryptionData(data, mappedData);
  }

  return mappedData;
}

function sendRequest(data, mappedData, apiVersion) {
  const requestUrl = generateRequestUrl(data, apiVersion);
  const requestOptions = generateRequestOptions(data, apiVersion);
  const requestBody = mappedData;

  log({
    Name: 'GoogleConversionEvent',
    Type: 'Request',
    EventName: 'ConversionEvent',
    RequestMethod: 'POST',
    RequestUrl: requestUrl,
    RequestBody: requestBody
  });

  return sendHttpRequest(requestUrl, requestOptions, JSON.stringify(requestBody))
    .then((result) => {
      // .then has to be used when the Authorization header is in use
      log({
        Name: 'GoogleConversionEvent',
        Type: 'Response',
        EventName: 'ConversionEvent',
        ResponseStatusCode: result.statusCode,
        ResponseHeaders: result.headers,
        ResponseBody: result.body
      });

      if (!useOptimisticScenario) {
        if (result.statusCode >= 200 && result.statusCode < 400) {
          data.gtmOnSuccess();
        } else {
          data.gtmOnFailure();
        }
      }
    })
    .catch((result) => {
      log({
        Name: 'GoogleConversionEvent',
        Type: 'Message',
        EventName: 'ConversionEvent',
        Message: 'Request failed or timed out.',
        Reason: JSON.stringify(result)
      });

      if (!useOptimisticScenario) data.gtmOnFailure();
    });
}

function validateMappedData(mappedData) {
  const conversionEvents = mappedData.events;

  if (getType(conversionEvents) !== 'array' || conversionEvents.length === 0) {
    return 'At least 1 Conversion Event must be specified.';
  }

  const isUserDataAbsent = (event) => {
    return (
      getType(event.userData) !== 'object' ||
      getType(event.userData.userIdentifiers) !== 'array' ||
      event.userData.userIdentifiers.length === 0 ||
      event.userData.userIdentifiers.some((i) => {
        const userIdentifierIsObject = getType(i) === 'object';
        const userIdentifierKey = userIdentifierIsObject ? Object.keys(i)[0] : undefined;
        const userIdentifierValue = userIdentifierIsObject ? Object.values(i)[0] : undefined;
        return (
          !hasProps(i) ||
          !userIdentifierValue ||
          (userIdentifierKey === 'address' &&
            (!hasProps(userIdentifierValue) || Object.values(userIdentifierValue).some((v) => !v)))
        );
      })
    );
  };
  const isAdIdentifiersAbsent = (event) => {
    const adIdentifierEntries =
      getType(event.adIdentifiers) === 'object' ? Object.entries(event.adIdentifiers) : undefined;
    return (
      getType(event.adIdentifiers) !== 'object' ||
      !hasProps(event.adIdentifiers) ||
      adIdentifierEntries.every((keyValue) => {
        const key = keyValue[0];
        const value = keyValue[1];
        return (
          !value ||
          (key === 'landingPageDeviceInfo' &&
            (!hasProps(value) || Object.values(value).every((v) => !v)))
        );
      })
    );
  };
  const doesNotHaveMatchData = conversionEvents.some((event) => {
    return isUserDataAbsent(event) && isAdIdentifiersAbsent(event);
  });
  if (doesNotHaveMatchData) {
    return 'At least 1 Ad Identifier or User Data must be specified.';
  }

  const rfc3339Regex = '^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.+';
  const isTimestampFormatInvalid = conversionEvents.some((event) => {
    return ['eventTimestamp', 'lastUpdatedTimestamp'].some((key) => {
      return event[key] && (getType(event[key]) !== 'string' || !event[key].match(rfc3339Regex));
    });
  });
  if (isTimestampFormatInvalid) {
    return 'Timestamp format is invalid.';
  }

  const destinations = mappedData.destinations;
  const destinationsLengthLimit = 10;
  if (destinations.length > destinationsLengthLimit) {
    return 'Destinations list length must be at most ' + destinationsLengthLimit + '.';
  }

  const validationKeys = [
    'productDestinationId',
    'reference',
    'operatingAccount.accountId',
    'loginAccount.accountId'
  ];
  for (let i = 0; i < destinations.length; i++) {
    const destination = destinations[i];
    for (let j = 0; j < validationKeys.length; j++) {
      const key = validationKeys[j];
      const parts = key.split('.');
      if (parts.length > 1 && !destination[parts[0]]) continue;
      const value = parts.reduce((acc, part) => acc && acc[part], destination);
      if (!isValidValue(value) || ['undefined', 'null'].indexOf(value) !== -1) {
        return 'destinations[' + i + '].' + key + ' is invalid.';
      }
    }
  }
}

function handleConversionEvent(data, eventData) {
  const mappedData = getDataForConversionEventsUpload(data, eventData);

  const invalidOrMissingFields = validateMappedData(mappedData);
  if (invalidOrMissingFields) {
    log({
      Name: 'GoogleConversionEvent',
      Type: 'Message',
      EventName: 'ConversionEvent',
      Message: 'Request was not sent.',
      Reason: invalidOrMissingFields
    });

    data.gtmOnFailure();
    return true;
  }

  sendRequest(data, mappedData, apiVersion);
}

/*==============================================================================
  Helpers
==============================================================================*/

function shouldExitEarly(data, eventData) {
  if (!isConsentGivenOrNotRequired(data, eventData)) return true;

  const url = getUrl(data);
  if (url && url.lastIndexOf('https://gtm-msr.appspot.com/', 0) === 0) return true;

  return false;
}

function getUrl(eventData) {
  return eventData.page_location || eventData.page_referrer || getRequestHeader('referer');
}

function getCookieDomain(data) {
  return !data.cookieDomain || data.cookieDomain === 'auto'
    ? computeEffectiveTldPlusOne(getEventData('page_location') || getRequestHeader('referer')) ||
        'auto'
    : data.cookieDomain;
}

function enc(data) {
  if (['null', 'undefined'].indexOf(getType(data)) !== -1) data = '';
  return encodeUriComponent(makeString(data));
}

function hasProps(obj) {
  return getType(obj) === 'object' && Object.keys(obj).length > 0;
}

function isSHA256Base64Hashed(value) {
  if (!value) return false;
  const valueStr = makeString(value);
  const base64Regex = '^[A-Za-z0-9+/]{43}=?$';
  return valueStr.match(base64Regex) !== null;
}

function isSHA256HexHashed(value) {
  if (!value) return false;
  const valueStr = makeString(value);
  const hexRegex = '^[A-Fa-f0-9]{64}$';
  return valueStr.match(hexRegex) !== null;
}

function hashData(value) {
  if (!value) return value;

  const type = getType(value);

  if (value === 'undefined' || value === 'null') return undefined;

  if (type === 'array') {
    return value.map((val) => hashData(val));
  }

  if (type === 'object') {
    return Object.keys(value).reduce((acc, val) => {
      acc[val] = hashData(value[val]);
      return acc;
    }, {});
  }

  if (isSHA256HexHashed(value) || isSHA256Base64Hashed(value)) return value;

  return sha256Sync(makeString(value).trim().toLowerCase(), {
    outputEncoding: 'hex'
  });
}

function getConversionDateTime(timestamp) {
  if (!timestamp) return convertTimestampToRFC(getTimestampMillis());

  let timestampInt = makeInteger(timestamp);
  if (getType(timestampInt) === 'number' && timestampInt > 0) {
    const timestampString = makeString(timestamp);
    // This will be false only in 2286, when timestamps in seconds starts to have 11 digits.
    timestampInt = timestampString.length === 10 ? timestamp * 1000 : timestamp;
    return convertTimestampToRFC(timestampInt);
  }

  return timestamp;
}

function convertTimestampToRFC(timestamp) {
  const secToMs = function (s) {
    return s * 1000;
  };
  const minToMs = function (m) {
    return m * secToMs(60);
  };
  const hoursToMs = function (h) {
    return h * minToMs(60);
  };
  const daysToMs = function (d) {
    return d * hoursToMs(24);
  };
  const format = function (value) {
    return value >= 10 ? value.toString() : '0' + value;
  };
  const fourYearsInMs = daysToMs(365 * 4 + 1);
  let year = 1970 + Math.floor(timestamp / fourYearsInMs) * 4;
  timestamp = timestamp % fourYearsInMs;

  while (true) {
    const isLeapYear = !(year % 4);
    const nextTimestamp = timestamp - daysToMs(isLeapYear ? 366 : 365);
    if (nextTimestamp < 0) {
      break;
    }
    timestamp = nextTimestamp;
    year = year + 1;
  }

  const daysByMonth =
    year % 4 === 0
      ? [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
      : [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  let month = 0;
  for (let i = 0; i < daysByMonth.length; i++) {
    const msInThisMonth = daysToMs(daysByMonth[i]);
    if (timestamp > msInThisMonth) {
      timestamp = timestamp - msInThisMonth;
    } else {
      month = i + 1;
      break;
    }
  }
  const date = Math.ceil(timestamp / daysToMs(1));
  timestamp = timestamp - daysToMs(date - 1);
  const hours = Math.floor(timestamp / hoursToMs(1));
  timestamp = timestamp - hoursToMs(hours);
  const minutes = Math.floor(timestamp / minToMs(1));
  timestamp = timestamp - minToMs(minutes);
  const sec = Math.floor(timestamp / secToMs(1));

  return (
    year +
    '-' +
    format(month) +
    '-' +
    format(date) +
    'T' +
    format(hours) +
    ':' +
    format(minutes) +
    ':' +
    format(sec) +
    '+00:00'
  );
}

function isValidValue(value) {
  const valueType = getType(value);
  return valueType !== 'null' && valueType !== 'undefined' && value !== '' && value === value;
}

function replaceAll(str, find, replace) {
  if (getType(str) !== 'string') return str;
  const regex = createRegex(find, 'g');
  return str.replace(regex, replace);
}

function isUIFieldTrue(field) {
  return [true, 'true'].indexOf(field) !== -1;
}

function isConsentGivenOrNotRequired(data, eventData) {
  if (data.adStorageConsent !== 'required') return true;
  if (eventData.consent_state) return !!eventData.consent_state.ad_storage;
  const xGaGcs = eventData['x-ga-gcs'] || ''; // x-ga-gcs is a string like "G110"
  return xGaGcs[2] === '1';
}

function log(rawDataToLog) {
  const logDestinationsHandlers = {};
  if (determinateIsLoggingEnabled()) logDestinationsHandlers.console = logConsole;
  if (determinateIsLoggingEnabledForBigQuery()) logDestinationsHandlers.bigQuery = logToBigQuery;

  rawDataToLog.TraceId = getRequestHeader('trace-id');

  const keyMappings = {
    // No transformation for Console is needed.
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

  for (const logDestination in logDestinationsHandlers) {
    const handler = logDestinationsHandlers[logDestination];
    if (!handler) continue;

    const mapping = keyMappings[logDestination];
    const dataToLog = mapping ? {} : rawDataToLog;

    if (mapping) {
      for (const key in rawDataToLog) {
        const mappedKey = mapping[key] || key;
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
  const connectionInfo = {
    projectId: data.logBigQueryProjectId,
    datasetId: data.logBigQueryDatasetId,
    tableId: data.logBigQueryTableId
  };

  dataToLog.timestamp = getTimestampMillis();

  ['request_body', 'response_headers', 'response_body'].forEach((p) => {
    dataToLog[p] = JSON.stringify(dataToLog[p]);
  });

  BigQuery.insert(connectionInfo, [dataToLog], { ignoreUnknownValues: true });
}

function determinateIsLoggingEnabled() {
  const containerVersion = getContainerVersion();
  const isDebug = !!(
    containerVersion &&
    (containerVersion.debugMode || containerVersion.previewMode)
  );

  if (!data.logType) {
    return isDebug;
  }

  if (data.logType === 'no') {
    return false;
  }

  if (data.logType === 'debug') {
    return isDebug;
  }

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
        "publicId": "read_container_data",
        "versionId": "1"
      },
      "param": []
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
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://datamanager.googleapis.com/*"
              },
              {
                "type": 1,
                "string": "https://waster.sourei.com.br/*"
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
                "string": "https://www.googleapis.com/auth/datamanager"
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
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "FPGCLAW"
              },
              {
                "type": 1,
                "string": "_gcl_aw"
              },
              {
                "type": 1,
                "string": "FPGCLAG"
              },
              {
                "type": 1,
                "string": "_gcl_ag"
              },
              {
                "type": 1,
                "string": "FPGCLGB"
              },
              {
                "type": 1,
                "string": "_gcl_gb"
              },
              {
                "type": 1,
                "string": "_dm_session_attributes"
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
        "publicId": "set_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedCookies",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "name"
                  },
                  {
                    "type": 1,
                    "string": "domain"
                  },
                  {
                    "type": 1,
                    "string": "path"
                  },
                  {
                    "type": 1,
                    "string": "secure"
                  },
                  {
                    "type": 1,
                    "string": "session"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_dm_session_attributes"
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
                    "string": "any"
                  },
                  {
                    "type": 1,
                    "string": "any"
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

scenarios:
- name: Wascer flow with MCC sends loginAccount and no linkedAccount
  code: |-
    mockData.wasterAuthDestinationsList[0].loginAccountId = '444-555-6666';

    let sentBody;
    mock('sendHttpRequest', (url, options, body) => {
      sentBody = JSON.parse(body);
      return Promise.create((resolve) => resolve({ statusCode: 200, body: '{}' }));
    });

    runCode(mockData);

    const destination = sentBody.destinations[0];
    assertThat(destination.operatingAccount.accountId).isEqualTo('1112223333');
    assertThat(destination.loginAccount.accountId).isEqualTo('4445556666');
    assertThat(destination.loginAccount.accountType).isEqualTo('GOOGLE_ADS');
    assertThat(destination.linkedAccount).isUndefined();
- name: Wascer flow without MCC sends no loginAccount
  code: |-
    let sentBody;
    mock('sendHttpRequest', (url, options, body) => {
      sentBody = JSON.parse(body);
      return Promise.create((resolve) => resolve({ statusCode: 200, body: '{}' }));
    });

    runCode(mockData);

    const destination = sentBody.destinations[0];
    assertThat(destination.operatingAccount.accountId).isEqualTo('1112223333');
    assertThat(destination.loginAccount).isUndefined();
    assertThat(destination.linkedAccount).isUndefined();
- name: Legacy consent values GRANTED and DENIED map to the API enum
  code: |-
    mockData.adUserData = 'GRANTED';
    mockData.adPersonalization = 'denied';

    let sentBody;
    mock('sendHttpRequest', (url, options, body) => {
      sentBody = JSON.parse(body);
      return Promise.create((resolve) => resolve({ statusCode: 200, body: '{}' }));
    });

    runCode(mockData);

    assertThat(sentBody.consent.adUserData).isEqualTo('CONSENT_GRANTED');
    assertThat(sentBody.consent.adPersonalization).isEqualTo('CONSENT_DENIED');
- name: CONSENT_STATUS_UNSPECIFIED is kept
  code: |-
    mockData.adUserData = 'CONSENT_STATUS_UNSPECIFIED';

    let sentBody;
    mock('sendHttpRequest', (url, options, body) => {
      sentBody = JSON.parse(body);
      return Promise.create((resolve) => resolve({ statusCode: 200, body: '{}' }));
    });

    runCode(mockData);

    assertThat(sentBody.consent.adUserData).isEqualTo('CONSENT_STATUS_UNSPECIFIED');
setup: |-
  const JSON = require('JSON');
  const Promise = require('Promise');

  const mockData = {
    authFlow: 'waster',
    eventType: 'conversion',
    conversionEventMode: 'single',
    validateOnly: true,
    adIdentifiersGclid: 'test-gclid',
    wasterAuthDestinationsList: [
      {
        product: 'GOOGLE_ADS',
        operatingAccountId: '1112223333',
        productDestinationId: '987654321',
        loginAccountId: ''
      }
    ]
  };

  mock('getAllEventData', { event_name: 'purchase' });
  mock('getRequestHeader', (name) => (name === 'x-user-id' ? 'user-1' : undefined));


___NOTES___

Created from Google Conversion Events by Stape template.
Adapted for Waster proxy authentication.
