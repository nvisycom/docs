<div align="center">

# Nvisy Docs

**Documentation for the Nvisy multimodal redaction platform.**

Guides, API reference, and SDK documentation, built with Mintlify and
deployed to docs.nvisy.com.

[**nvisy.com**](https://nvisy.com) · [**docs.nvisy.com**](https://docs.nvisy.com)

</div>

The published source for [docs.nvisy.com](https://docs.nvisy.com). Pages are
MDX files whose paths match the entries under `navigation` in
[`docs.json`](docs.json), which also holds theming, tabs, and the anchors.
The API reference is generated from
[`api-reference/openapi.json`](api-reference/openapi.json), regenerated from a
running server rather than edited by hand.

> [!WARNING]
> **Active development: API not stable.** This project is under active
> development. Public APIs, configuration shapes, on-disk formats, and
> wire protocols may change without notice between releases. Pages here
> track `main` and may describe unreleased behavior.

## Contents

**[Overview](index.mdx)**  
Introduction, quickstart, and FAQ.

**[Features](features)**  
Redaction workflow, AI detection, supported formats, audit trails, and integrations.

**[Deployment](deployment)**  
Cloud and on-premise setup, requirements, and installation.

**[API Reference](api-reference)**  
REST endpoints, generated from the OpenAPI specification.

**[SDKs](sdks)**  
TypeScript, Python, and Rust quickstarts, API references, and examples.

## Quick Start

Install the Mintlify CLI and start the dev server on `localhost:3000`:

```bash
make install
make dev
```

Validate the OpenAPI spec and check for broken internal links before opening a
pull request:

```bash
make check
```

## OpenAPI

The specification is generated from a running server, never written by hand.
Regenerate it against production or a local instance:

```bash
make generate         # from https://api.nvisy.com
make generate-local   # from http://127.0.0.1:8080
```

Both fetch the spec, pretty-print it, and validate the result before writing.
An invalid spec leaves the existing
[`api-reference/openapi.json`](api-reference/openapi.json) untouched.

Endpoint pages are rendered from that file at build time, so a regenerated spec
is the only change needed when the API surface moves. The
[`nvisycom/sdk-ts`](https://github.com/nvisycom/sdk-ts) client is the reference
for how the API is meant to be called.

## Project

- **License**: MIT, see [LICENSE](LICENSE)

Deploys happen automatically on merge to `main` via the Mintlify GitHub app.

## Support

- **Documentation**: [docs.nvisy.com](https://docs.nvisy.com)
- **Email**: [support@nvisy.com](mailto:support@nvisy.com)
- **API Status**: [nvisy.openstatus.dev](https://nvisy.openstatus.dev)
