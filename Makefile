# Using bash
SHELL := /bin/bash

# One worker at the time
MAKEFLAGS = --jobs=1

.PHONY: build
build: ## build docker image
	docker build -t larvata/awx-cli .

.PHONY: push
push: ## publish docker image
	docker push larvata/awx-cli

.PHONY: run
run: ## run into docker container
	$(MAKE) build
	docker run --rm -it larvata/awx-cli sh

# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
