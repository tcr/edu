.PHONY: all clean

all: build build/diffeq.html

clean:
	rm -rf build

build:
	mkdir -p build

build/diffeq.html: diffeq.lyx
	/Applications/LyX.app/Contents/MacOS/lyx --export pdflatex diffeq.lyx
	mv diffeq.tex build
	cd build; yes "" | htlatex diffeq.tex "../html.cfg, charset=utf-8" " -cunihtf -utf8"
