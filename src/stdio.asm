;; ####
;; Lê tecla digitada e a salva no registrador r0
;;
stdioReadChar:
	push r7
	push r6

	loadn r7, #255 ;; processador sempre retorna 255 se nenhuma tecla for lida
	loadn r6, #0   ;; processador sempre retorna 0 no instante em que alguma tecla for lida, a próxima leitura é o valor da tecla

	readChar_loop:
		inchar r0

		;; compara com 255
		cmp r0, r7
		jeq readChar_loop

		;; compara com 0
		cmp r0, r6
		jeq readChar_loop

	pop r6
	pop r7
	rts

;; ####
;; Imprime jogador na posição adequada da tela e restaura posição anterior
;;
;; @param r6: posição onde será desenhado o primeiro pixo
;; @param r7: endereço de memória do primeiro pixo do sprite a ser desenhado
;;
stdioPrintSprite:
    push r0
    push r1
    push r2
    push r6
    push r7

    ;; Vai ser usado nas somas
    ;; A tela tem 30 linhas e 40 colunas
    ;; Somar 40 é equivalente a descer verticalmente
    loadn r0, #40

    ;; Primeiro pixo
    loadi r1, r7
    mov r2, r6
    outchar r1, r2

    ;; Segundo pixo
    inc r7
    loadi r1, r7
    inc r2
    outchar r1, r2

    ;; Terceiro pixo
    inc r7
    loadi r1, r7
    add r2, r2, r0      ;; r2 += 40
    outchar r1, r2

    ;; Quarto pixo
    inc r7
    loadi r1, r7
    dec r2
    outchar r1, r2

    pop r7
    pop r6
    pop r2
    pop r1
    pop r0
    rts
