# Google Data Manager Wascer

A Google Tag Manager **server** tag that sends offline conversion events to the
Google Data Manager API. It hashes personal data before it leaves the container,
carries the click identifiers Google needs for attribution, and honours consent
signals.

Built by [Wascer](https://wascer.com) for the server containers we host, and free
for anyone to use.

## What the template does

1. Sends offline conversions to the Google Data Manager API.
2. Runs through the Wascer proxy, or through your own credentials.
3. Hashes email, phone and address fields before sending them.
4. Carries GCLID, GBRAID and WBRAID so Google can attribute the conversion.
5. Passes ad storage, ad user data and ad personalization consent through.
6. Can validate only, so you can dry run an event before spending a real one.
7. Optionally logs every call into a BigQuery table.

## Installation

1. In your **server** container, open **Templates**, then **Tag Templates**,
   then **New**.
2. Open the three dot menu and choose **Import**.
3. Pick `template.tpl` from this repository and save.
4. Create a tag from the template, fill in the fields below, and attach a trigger.

## Fields

| Field | Type | What it does |
|---|---|---|
| Authentication Flow | Select | Wascer proxy, or your own Google credentials. |
| Google Ads Account ID | Text | Destination account the conversion belongs to. |
| Conversion Action ID | Text | Conversion action being reported. |
| Event Settings | Group | Source, value, currency, transaction id, timestamp and validate only. |
| Click Attribution | Group | GCLID, GBRAID and WBRAID. |
| User Data | Group | Email, phone, name, address, city, region, postal and country. Hashed before sending. |
| Consent Settings | Group | Ad storage, ad user data and ad personalization. |
| Extra Fields | Group | User agent and IP address. |
| Logging | Group | Console logging plus optional BigQuery project, dataset and table. |

## Requirements

A Google Tag Manager **server** container.
Templates published by Wascer are tested against the container images we host.

## Support

Open an issue in this repository, or reach the team at
[wascer.com](https://wascer.com). If you host your server container with Wascer,
support is included in your plan.

## License

Apache License 2.0. See [LICENSE](LICENSE).
