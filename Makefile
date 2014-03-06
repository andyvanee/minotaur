LESSC=./node_modules/.bin/lessc

MN=$(wildcard less/*.less)
BS=$(wildcard bower_components/bootstrap/less/*.less)
LESSHAT=$(wildcard bower_components/lesshat/build/*.less)
FA=$(wildcard bower_components/font-awesome/less/*.less)

DEPS=$(MN) $(BS) $(LESSHAT) $(FA)

.PHONY: demo
demo: demo/style.css demo/zepto.min.js

demo/style.css: $(DEPS) demo/demo.less
	$(LESSC) --compress --include-path=bower_components demo/demo.less $@

demo/zepto.min.js: bower_components/zepto/zepto.min.js
	cp $? $@
