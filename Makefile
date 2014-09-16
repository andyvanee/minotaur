default: dist/css/minotaur.css

dist/css/minotaur.css: $(wildcard less/*.less)
	./node_modules/.bin/lessc --include-path=node_modules --compress less/minotaur.less dist/css/minotaur.css
	@ wc -m dist/css/minotaur.css
