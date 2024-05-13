SHELL := /bin/bash
DEPS ?= build

# To install lua-ls, see : https://github.com/LuaLS/lua-language-server/wiki/Getting-Started
LUA_LS ?= $(DEPS)/lua-language-server
LINT_LEVEL ?= Information

install:
	sudo apt-get install luarocks -y
	sudo luarocks install busted

test:
	busted ./tests/dockdb_test.lua

all:

lint:
	@rm -rf $(LUA_LS)
	@mkdir -p $(LUA_LS)
	@VIM=$(HOME)/.local/share/nvim lua-language-server --check $(PWD) --checklevel=$(LINT_LEVEL) --logpath=$(LUA_LS)
	@[[ -f $(LUA_LS)/check.json ]] && { cat $(LUA_LS)/check.json 2>/dev/null; exit 1; } || true

clean:
	rm -rf $(DEPS)

.PHONY: all deps clean lint install test
