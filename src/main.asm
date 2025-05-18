jmp main

command: var #1

main:
	;;
	;; ler comando do teclado
	;;
	call readChar

	;;
	;; imprimir caractere lido no meio da tela
	;;
	loadn r1, #620
	outchar r0, r1
	jmp main

	halt

;; #include src/stdio.asm

