all: help

SHELL := /bin/bash

EXECUTABLES=docker docker-compose sbt npm widdershins

ifeq (logs, $(firstword $(MAKECMDGOALS)))
   logargs := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
   $(eval $(logargs):;@true)
endif

##	build:			Build or rebuild hermes services
.PHONY : build
build:
	@docker-compose -f stack/services.yaml build

 ## 	up:			Build and UP de environment
.PHONY : up
up:
	@docker-compose -f stack/services.yaml up -d --build

## 	down:			Brings the environment down
 .PHONY : down
 down:
	@docker-compose -f stack/services.yaml down

## 	dependencies: Install the libraries needed for the execution of scripts
 .PHONY : dependencies
 dependencies:
	./dependencies.sh
