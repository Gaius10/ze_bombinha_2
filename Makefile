test:
	./bin/compilador -i ./src/main.c -o ./build/main.asm
	./bin/montador ./build/main.asm ./build/main.mif
	./bin/simulador ./build/main.mif charmap.mif
