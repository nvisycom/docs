# Makefile for docs.nvisy.com

# Pretty output logging.
define print-make
@echo "[$(shell date '+%Y-%m-%d %H:%M:%S')] [MAKE] [$(MAKECMDGOALS)] $(1)"
endef

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
	mint openapi-check
	$(call print-make, "Checking for invalid internal links...")
	mint broken-links

.PHONY: update
update:
	mint version
	$(call print-make, "Updating Mintlify CLI...")
	mint update
	$(call print-make, "Mintlify CLI updated!")
