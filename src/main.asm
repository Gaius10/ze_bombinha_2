jmp main

;; ####
;; Control variables
;;
current_pos: var #1
previous_pos: var #1

main:
	;;
	;; Inicialmente, carrega player no centro da tela
	;;
    loadn r1, #620
    store current_pos, r1
    loadn r7, #SPRITE_PLAYER_ONE
    call printPlayer

	;;
	;; Inicializa clock
	;;
	load r7, CLOCK_LSB
	load r6, CLOCK_MSB

	;;
	;; Loop principal
	;;
    main_loop:
		call clock
        call readChar        ;; stdio.asm
        call execCommand

        jmp main_loop
    halt

;;
;; Atualiza registradores de relógio
;;
;; Obs.: essa função precisará ser adaptada caso haja coisas se movendo em frequencias
;; diferentes.
;;
clock:
	;;
	;; Decrementa LSB
	;; Quando LSB == 0, decrementa MSB
	;; Quando MSB == 0, reseta MSB
	;; Repete
	;;
	dec r7
	jnz _clock_pop

	load r7, CLOCK_LSB

	dec r6
	jnz _clock_pop

	load r6, CLOCK_MSB
	
	_clock_pop:
		;;
	rts

;;
;; Executa comando correspondente ao conteúdo do r0
;; @todo chamar funções por referência
;;
execCommand:
    push fr
    push r1

    load r1, COMMAND_MOVE_UP
    cmp r0, r1
    ceq command_MoveUp

    load r1, COMMAND_MOVE_DOWN
    cmp r0, r1
    ceq command_MoveDown

    load r1, COMMAND_MOVE_LEFT
    cmp r0, r1
    ceq command_MoveLeft

    load r1, COMMAND_MOVE_RIGHT
    cmp r0, r1
    ceq command_MoveRight

    pop r1
    pop fr
    rts

;; #include src/stdio.asm
;; #include src/moves.asm
;; #include config/commands.asm
;; #include config/sprites.asm
;; #include config/general.asm
