test: clear
	./bin/compilador -i ./src/main.c >> ./build/main.asm

	cat ./static/stdio.asm >> ./build/main.asm
	cat ./static/string.asm >> ./build/main.asm

	./bin/montador ./build/main.asm ./build/main.mif
	./bin/simulador build/main.mif static/charmap.mif

clear:
	rm -rf build/*
