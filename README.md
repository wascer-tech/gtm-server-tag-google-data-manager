# Google Data Manager Wascer

A Google Tag Manager **server** tag that sends offline conversion events to the
Google Data Manager API. It hashes personal data before it leaves the container,
carries the click identifiers Google needs for attribution, and honours consent
signals.

Built by [Wascer](https://wascer.com) for the server containers we host, and free
for anyone to use.

## What the template does

1. Sends conversion events to the Google Data Manager API, one event or many
   per request.
2. Runs through the Wascer proxy, or through your own Google credentials.
3. Sends one event to several destinations at once. Each destination can name a
   manager account (MCC) as the login account, for accounts you reach through
   one.
4. Hashes email, phone and address fields before sending them, with optional
   encryption on top.
5. Carries GCLID, GBRAID and WBRAID so Google can attribute the conversion,
   reading them from the URL or the session cookies when the event lacks them.
6. Sends ad user data and ad personalization consent in the format the API
   expects.
7. Can validate only, so you can dry run an event before spending a real one.
8. Logs to the console and, optionally, to a BigQuery table.

## Installation

1. In your **server** container, open **Templates**, then **Tag Templates**,
   then **New**.
2. Open the three dot menu and choose **Import**.
3. Pick `template.tpl` from this repository and save.
4. Create a tag from the template, fill in the fields below, and attach a trigger.

## Fields

| Field | Type | What it does |
|---|---|---|
| Event Type | Radio | Conversion, or a page view that saves the session attributes (gclid, gbraid, `gad_` parameters) in a cookie for later conversions. |
| Authentication Type | Radio | Wascer proxy, or your own Google credentials. |
| Destination Accounts and Conversion Events | Table | One row per destination: product, operating account, optional login account (MCC) and the conversion action. |
| Validate Only | Select | Validates the request without recording the conversion. |
| Request-level Consent | Group | Ad user data and ad personalization consent for the whole request. |
| Conversion Events | Group | Encoding, encryption, single or multiple events, and the conversion, user, ad identifier, device, cart and custom variable data. |
| Session Attributes Cookie Settings | Group | Expiration, domain, SameSite and HttpOnly of the cookies the page view event writes. |
| Tag Execution Consent Settings | Radio | Whether the tag requires ad storage consent to fire. |
| Logs Settings | Group | Console logging plus optional BigQuery project, dataset and table. |

## Requirements

A Google Tag Manager **server** container.
Templates published by Wascer are tested against the container images we host.

## Support

Open an issue in this repository, or reach the team at
[wascer.com](https://wascer.com). If you host your server container with Wascer,
support is included in your plan.

## License

Apache License 2.0. See [LICENSE](LICENSE).
