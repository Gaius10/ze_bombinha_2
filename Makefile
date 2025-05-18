run: clear
	./bin/linker ./src/main.asm ./build/main.asm
	./bin/montador ./build/main.asm ./build/main.mif
	./bin/simulador build/main.mif static/charmap.mif

clear:
	rm -rf build/*
