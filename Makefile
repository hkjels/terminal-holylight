
SHELL:=/bin/bash

#
# Preferences
#

LIGHT?=$(shell read -p "Light profile: " profile;echo "$$profile")
DARK?=$(shell read -p "Dark profile: " profile;echo "$$profile")
THRESHOLD?=1000000
THROTTLE?=10


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

build: vim-holylight/bin/holylight-checker $(SRC:%.applescript=build/%.app) $(PLIST:%.plist=build/%.plist)
	cp $< $@
	@echo
	@echo '    Built!'
	@echo

build/%.app: %.applescript
	mkdir -p build
	osacompile -so $@ $^
	chmod +x $@

build/%.plist: %.plist
	cat $^ | \
		sed -e 's@{{PREFIX}}@${PREFIX}@g' \
		-e 's@{{LIGHT}}@${LIGHT}@g' \
		-e 's@{{DARK}}@${DARK}@g' \
		-e 's@{{THRESHOLD}}@${THRESHOLD}@g' \
		-e 's@{{THROTTLE}}@${THROTTLE}@g' \
		> $@

install: build
	cp -r build $(OPT)
	sudo cp $(OPT)/no.take.terminal-holylight.plist $(AGENTS_PATH)

uninstall:
	rm -fr $(OPT)
	rm -f $(AGENTS_PATH)/no.take.terminal-holylight.plist

clean:
	rm -fr build

.PHONY: install uninstall

