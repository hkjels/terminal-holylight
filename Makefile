
SHELL:=/bin/sh


#
# Paths
#

PKG=terminal-holylight
PREFIX?=/usr/local
AGENTS_PATH:=/Library/LaunchAgents
OPT:=$(PREFIX)/opt/$(PKG)


#
# Sources
#

SRC:=$(wildcard *.applescript)
PLIST:=$(wildcard *.plist)


#
# Targets
#

build: vim-holylight/bin/holylight-checker $(SRC:%.applescript=build/%.scpt) $(PLIST:%.plist=build/%.plist)
	cp $< $@
	@echo
	@echo '    Built!'
	@echo

build/%.scpt: %.applescript
	mkdir -p build
	osacompile -o $@ $^

build/%.plist: %.plist
	cat $^ | sed -e 's@{{PREFIX}}@${PREFIX}@g' > $@

install: build
	cp -r build $(OPT)
	ln -is $(OPT)/holylight-checker $(PREFIX)/bin
	sudo ln -is $(OPT)/no.take.terminal-holylight.plist $(AGENTS_PATH)

uninstall:
	rm -fr $(OPT)
	rm -f $(PREFIX)/bin/holylight-checker
	rm -f $(AGENTS_PATH)/no.take.terminal-holylight.plist

clean:
	rm -fr build

.PHONY: install uninstall

