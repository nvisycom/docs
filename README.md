# Nvisy Docs

Documentation site for Nvisy, the open-source multimodal redaction API.
Built with [Mintlify](https://mintlify.com) and deployed to
[docs.nvisy.com](https://docs.nvisy.com).

> [!WARNING]
> **Active development: API not stable.** This project is under active
> development. Public APIs, configuration shapes, on-disk formats, and
> wire protocols may change without notice between releases. Pages here
> track `main` and may describe unreleased behavior.

## Contents

- **Overview:** Introduction, quickstart, and FAQ
- **Features:** Redaction workflow, AI detection, supported formats, audit trails, integrations
- **Deployment:** Cloud and on-premise setup, requirements, and installation
- **API Reference:** REST endpoints generated from [`api-reference/openapi.json`](api-reference/openapi.json)
- **SDKs:** TypeScript and Python quickstarts, API references, and examples

## Quick Start

Install the Mintlify CLI and start the dev server on `localhost:3000`:

```bash
make install
make dev
```

Navigation, theming, and tabs are configured in
[`docs.json`](docs.json). Pages are MDX files whose paths match the entries
under `navigation`.

## Checks

Validate the OpenAPI spec and check for broken internal links:

```bash
make check
```

Run this before opening a pull request. Deploys happen automatically on
merge to `main` via the Mintlify GitHub app.

## License

MIT License, see [LICENSE.txt](LICENSE.txt)

## Support

- **Documentation:** [docs.nvisy.com](https://docs.nvisy.com)
- **Issues:** [GitHub Issues](https://github.com/nvisycom/docs/issues)
- **Email:** [support@nvisy.com](mailto:support@nvisy.com)
- **API Status:** [nvisy.openstatus.dev](https://nvisy.openstatus.dev)
