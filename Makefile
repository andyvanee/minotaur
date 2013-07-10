#!/bin/bash

DEMOCSS = demo/style.css
DEMOLESS = $(wildcard demo/*.less)
BUILD = build/minotaur.css
MINOTAUR = $(wildcard minotaur/*.less)
MINOTAURUI = $(wildcard minotaur-ui/*.less)

default: thedemo $(BUILD) variables.less

variables.less: minotaur/variables.less minotaur-ui/variables.less
	cat $^ > $@

thedemo: $(DEMOCSS)

$(DEMOCSS): $(DEMOLESS) $(MINOTAUR) $(MINOTAURUI)
	lessc --compress demo/style.less > $@

$(BUILD): $(MINOTAUR) $(MINOTAURUI)
	mkdir -p build
	lessc --compress minotaur/build.less > $@
