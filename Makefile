# Makefile for docs.nvisy.com

# Pretty output logging.
define print-make
@echo "[$(shell date '+%Y-%m-%d %H:%M:%S')] [MAKE] [$(MAKECMDGOALS)] $(1)"
endef

# OpenAPI specification sources.
OPENAPI_SPEC := ./api-reference/openapi.json
OPENAPI_REMOTE_URL := https://api.nvisy.com/openapi.json
OPENAPI_LOCAL_URL := http://127.0.0.1:8080/api/openapi.json

.PHONY: install
install:
	$(call print-make, "Installing Mintlify CLI...")
	npm i -g mint
	$(call print-make, "Mintlify CLI installed!")
	mint version

.PHONY: dev
dev:
	$(call print-make, "Checking Mintlify CLI...")
	mint version
	$(call print-make, "Running Mintlify CLI...")
	mint dev

.PHONY: check
check:
	$(call print-make, "Checking Mintlify CLI...")
	mint version
	$(call print-make, "Checking if an OpenAPI spec is valid...")
	mint openapi-check $(OPENAPI_SPEC)
	$(call print-make, "Checking for invalid internal links...")
	mint broken-links

# Fetch the OpenAPI spec, pretty-print it, and validate the result.
# $(1) source URL, $(2) human-readable label.
define fetch-openapi
	$(call print-make, "Checking connection to $(2) API...")
	@curl -sf $(1) -o /dev/null || (echo "Error: Cannot connect to $(1)" && exit 1)
	$(call print-make, "Generating OpenAPI specification from $(2) API...")
	@curl -sf $(1) | python3 -m json.tool > $(OPENAPI_SPEC).tmp || (rm -f $(OPENAPI_SPEC).tmp && echo "Error: Invalid JSON from $(1)" && exit 1)
	$(call print-make, "Validating generated specification...")
	@mint openapi-check $(OPENAPI_SPEC).tmp || (rm -f $(OPENAPI_SPEC).tmp && echo "Error: Invalid OpenAPI spec from $(1); keeping existing $(OPENAPI_SPEC)" && exit 1)
	@mv $(OPENAPI_SPEC).tmp $(OPENAPI_SPEC)
	$(call print-make, "OpenAPI specification written to $(OPENAPI_SPEC)")
endef

.PHONY: generate
generate:
	$(call fetch-openapi,$(OPENAPI_REMOTE_URL),production)

.PHONY: generate-local
generate-local:
	$(call fetch-openapi,$(OPENAPI_LOCAL_URL),local)

.PHONY: update
update:
	mint version
	$(call print-make, "Updating Mintlify CLI...")
	mint update
	$(call print-make, "Mintlify CLI updated!")
