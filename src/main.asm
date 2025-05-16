	jmp main

command: var #1

main:
	;
	; ler comando do teclado
	;	
	ler:
		inchar r0
		loadn r1, #255
		cmp r0, r1
		jeq ler
		loadn r1, #0
		cmp r0, r1
		jeq ler

	;
	; imprimir caractere lido no meio da tela
	;
	loadn r1, #620
	outchar r0, r1
	jmp main

    halt

