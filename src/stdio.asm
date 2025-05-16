;###
; Lê tecla digitada e a salva no registrador r0
;
readChar:
	push r7
	push r6

	loadn r7, #255 ; processador sempre retorna 255 se nenhuma tecla for lida
	loadn r6, #0   ; processador sempre retorna 0 no instante em que alguma tecla for lida, a próxima leitura é o valor da tecla

	readChar_loop:
		inchar r0

		; compara com 255
		cmp r0, r7
		jeq readChar_loop

		; compara com 0
		cmp r0, r6
		jeq readChar_loop

	pop r6
	pop r7
	rts

