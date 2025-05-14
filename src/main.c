#include "lib/stdio.h"

int main()
{
	char letra;

	prints("Digite uma letra");

	letra = getc();

	prints("\nLetra digitada: ");
	printc(letra);
    return 0;
}
