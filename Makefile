LESSC=./node_modules/.bin/lessc

SRC=$(wildcard src/*.less)
BS=$(wildcard bower_components/bootstrap/less/*.less)
LESSHAT=$(wildcard bower_components/lesshat/build/*.less)
DEPS=$(SRC) $(BS) $(LESSHAT)
TARGETS=style.min.css zepto.min.js

default: $(TARGETS)

style.min.css: $(DEPS) src/demo.less
	$(LESSC) --compress --include-path=bower_components src/demo.less $@

zepto.min.js: bower_components/zepto/zepto.min.js
	cp $? $@

clean:
	rm -rf $(TARGETS)
