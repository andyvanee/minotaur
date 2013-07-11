#!/bin/bash

DEMOCSS = demo/style.css
DEMOLESS = $(wildcard demo/*.less)
BUILD = build/minotaur.css
MINOTAUR = $(wildcard minotaur/*.less)

default: thedemo $(BUILD) variables.less

variables.less: minotaur/variables.less
	cat $^ > $@

thedemo: $(DEMOCSS)

$(DEMOCSS): $(DEMOLESS) $(MINOTAUR)
	lessc --compress demo/style.less > $@

$(BUILD): $(MINOTAUR)
	mkdir -p build
	lessc --compress minotaur/build.less > $@
