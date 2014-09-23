default: dist/css/minotaur.css

dist/css/minotaur.css: $(wildcard less/*.less)
	mkdir -p $(@D)
	lessc --include-path=bower_components --compress less/minotaur.less > dist/css/minotaur.css
	@ wc -m dist/css/minotaur.css
