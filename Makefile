SHELL := /bin/bash
ACTUAL := $(shell pwd)
MIX_ENV ?=prod

export MIX_ENV
export ACTUAL

help:
	@echo -e "\tmake clean\t Clean files from build"
	@echo -e "\tmake deps\t Gets and compile dependencies"
	@echo -e "\tmake compile\t Compile mix project"
	@echo -e  "\tmake build\t Build escript and generate the file"

all: build

clean:
	mix clean
	rm -f cli

deps: clean
	mix deps.get
	mix deps.compile

compile: deps
	mix compile

build: compile
	mix escript.build
