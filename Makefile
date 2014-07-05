
SHELL:=/bin/sh


#
# Paths
#

PREFIX?=/usr/local
AGENTS_PATH:=/Library/LaunchAgents


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
	cp -r build $(PREFIX)/opt/terminal-holylight
	ln -is $(PREFIX)/opt/terminal-holylight/holylight-checker $(PREFIX)/bin
	sudo ln -is $(PREFIX)/opt/terminal-holylight/no.take.terminal-holylight.plist $(AGENTS_PATH)

uninstall:
	rm -fr $(PREFIX)/opt/terminal-holylight
	rm -f $(PREFIX)/bin/holylight-checker
	rm -f $(AGENTS_PATH)/no.take.terminal-holylight.plist

clean:
	rm -fr build

.PHONY: install uninstall

