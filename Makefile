.PHONY: all clean

all: build build/diffeq.html

clean:
	rm -rf build

build:
	mkdir -p build

build/diffeq.html: diffeq.lyx
	npm install
	cd build; cp ../*.lyx ../*.png .
	cd build; /Applications/LyX.app/Contents/MacOS/lyx --export xhtml ./diffeq.lyx
	cd build; node -p "'<!DOCTYPE html>\n<html>' + require('cheerio').load(require('fs').readFileSync('./diffeq.xhtml'))('html').html() + '</html>'" > diffeq.html
