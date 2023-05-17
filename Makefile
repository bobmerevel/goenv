# import deploy config
# You can change the default deploy config with `make cnf="deploy_special.env" release`
dpl ?= ./conf/deploy.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

# Clear cache
.PHONY: clean

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## Make usage helper
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

install: ## Install command tool
	echo Installation started