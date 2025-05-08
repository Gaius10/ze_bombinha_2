test:
	./bin/compilador -i ./src/main.c -o ./build/main.asm
	./bin/montador ./build/main.asm ./build/main.mif

clear:
	rm -rf build/*
