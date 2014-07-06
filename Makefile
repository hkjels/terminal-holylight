
SHELL:=/bin/bash

#
# Preferences
#

HOLYLIGHT?=$(shell read -p "Light profile: " profile;echo "$$profile")
HOLYDARK?=$(shell read -p "Dark profile: " profile;echo "$$profile")
THRESHOLD?=100000
THROTTLE?=20


#
# Paths
#

PKG=terminal-holylight
PREFIX:=/usr/local
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
	cat $^ | \
		sed -e 's@{{PREFIX}}@${PREFIX}@g' \
				-e 's@{{HOLYLIGHT}}@${HOLYLIGHT}@g' \
				-e 's@{{HOLYDARK}}@${HOLYDARK}@g' \
				-e 's@{{THRESHOLD}}@${THRESHOLD}@g' \
				-e 's@{{THROTTLE}}@${THROTTLE}@g' \
		> $@

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

