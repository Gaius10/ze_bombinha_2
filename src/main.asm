jmp main

;; ####
;; Variáveis de controle
;;
clock: var #1           ; controlada pelo clockDelay
current_pos: var #1     ; controlada pelos comandos 'move'
scenario_map: var #300

;; Obs.: Se quiser escovar bits, da pra refazer essa lógica usando
;;       flags e operações bitwise
;; Enum: player state
;; 0 -> parado
;; 1 -> movendo cima
;; 2 -> movendo baixo
;; 3 -> movendo esquerda
;; 4 -> movendo direita
player_one_state: var #1

main:
    ; call initGame

    ;;
    ;; Loop principal
    ;;
    main_loop:
        loadn r4, #'A'
        load r5, clock
        outchar r4, r5

        call clockDelay
        ; call stdioReadChar
        ; call execCommand
        ; call animate

        jmp main_loop
    halt

;;
;; Executa comando correspondente ao conteúdo do r0
;; @todo chamar funções por referência
;;
execCommand:
    push fr
    push r1

    load r1, COMMAND_MOVE_UP
    cmp r0, r1
    ceq commandMoveUp

    load r1, COMMAND_MOVE_DOWN
    cmp r0, r1
    ceq commandMoveDown

    load r1, COMMAND_MOVE_LEFT
    cmp r0, r1
    ceq commandMoveLeft

    load r1, COMMAND_MOVE_RIGHT
    cmp r0, r1
    ceq commandMoveRight

    pop r1
    pop fr
    rts

;; #include src/init.asm
;; #include src/stdio.asm
;; #include src/clock.asm
;; #include src/commandMove.asm
;; #include src/animate.asm
;; #include config/commands.asm
;; #include config/sprites.asm
;; #include config/general.asm
;; #include config/screen.asm
