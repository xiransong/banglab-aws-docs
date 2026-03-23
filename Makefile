SHELL := /bin/zsh

HOST ?= 127.0.0.1
PORT ?= 8000
PYTHON ?= python3
MKDOCS ?= mkdocs
DIST_FILE ?= banglab-aws-docs-site.zip

.PHONY: help doctor serve serve-public build build-strict dist clean

help: ## Show available commands
	@awk 'BEGIN {FS = ":.*## "}; /^[a-zA-Z0-9_-]+:.*## / {printf "%-14s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

doctor: ## Check whether MkDocs is available locally
	@command -v $(MKDOCS) >/dev/null 2>&1 || { \
		echo "MkDocs was not found in PATH."; \
		echo "If you use pyenv, try: make MKDOCS=$$HOME/.pyenv/shims/mkdocs doctor"; \
		exit 1; \
	}
	@$(MKDOCS) --version

serve: ## Preview the docs locally at http://127.0.0.1:8000
	@command -v $(MKDOCS) >/dev/null 2>&1 || { \
		echo "MkDocs was not found in PATH."; \
		echo "If you use pyenv, try: make MKDOCS=$$HOME/.pyenv/shims/mkdocs serve"; \
		exit 1; \
	}
	$(MKDOCS) serve -a $(HOST):$(PORT)


build: ## Build the static site into ./site
	@command -v $(MKDOCS) >/dev/null 2>&1 || { \
		echo "MkDocs was not found in PATH."; \
		echo "If you use pyenv, try: make MKDOCS=$$HOME/.pyenv/shims/mkdocs build"; \
		exit 1; \
	}
	$(MKDOCS) build

dist: ## Build the site and package it as a shareable zip file
	@command -v zip >/dev/null 2>&1 || { \
		echo "'zip' was not found in PATH."; \
		exit 1; \
	}
	@$(MAKE) build
	rm -f $(DIST_FILE)
	cd site && zip -qr ../$(DIST_FILE) .
	@echo "Created $(DIST_FILE)"

clean: ## Remove generated site output
	rm -rf site
