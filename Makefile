# ==================================================================================== #
# Boilerplate Laravel+Jetstream Makefile
# ==================================================================================== #

# ==================================================================================== #
# VARIABLES
# ==================================================================================== #

PROJECT_NAME ?= no-name-project
VIEWS_TYPE ?= livewire

# if request is eject, then set PROJECT_NAME to $(PROJECT_NAME)
ifeq ($(filter $(MAKECMDGOALS),eject),eject)
PROJECT_NAME = $(PROJECT_NAME)
endif

# if VIEWS_TYPE is neither blank, inertia or livewire, then stop with error
ifeq ($(filter $(VIEWS_TYPE),inertia livewire),)
$(error VIEWS_TYPE must be inertia or livewire)
endif

# ==================================================================================== #
# HELPERS
# ==================================================================================== #

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

.PHONY: confirm
confirm:
	@echo -n 'Are you sure? [y/N] ' && read ans && [ $${ans:-N} = y ]

## setup: setup project
.PHONY: setup
setup:
	PROJECT_NAME=$(PROJECT_NAME) docker-compose up php-setup && \
	PROJECT_NAME=$(PROJECT_NAME) docker-compose up node-setup && \
	PROJECT_NAME=$(PROJECT_NAME) docker-compose down --rmi all


## down: stop all containers
.PHONY: down
down: confirm
	docker-compose down

## clean: stop all containers and remove all images
.PHONY: clean
clean: confirm
	docker-compose down --rmi all

## destroy: destroy all project files, containers and images
.PHONY: destroy
destroy: confirm
	docker-compose down --rmi all
	rm -rf $(PROJECT_NAME)
	rm -rf postgres
	rm -rf .docker

# ==================================================================================== #
# DEVELOPMENT
# ==================================================================================== #

## start-dev: start project in development mode
.PHONY: start-dev
start-dev:
	PROJECT_NAME=$(PROJECT_NAME) docker-compose up php-dev

	
## rebuild-dev: rebuild debug image
.PHONY: rebuild-dev
rebuild-dev:
	PROJECT_NAME=$(PROJECT_NAME) docker-compose build php-dev

## eject: eject project from jetstream-setup
.PHONY: eject
eject:
	./eject-resources/eject.sh $(PROJECT_NAME)
