jmp main

;; ####
;; Control variables
;;
current_pos: var #1
previous_pos: var #1
current_frame: var #1

main:
    call initGame

    ;;
    ;; Loop principal
    ;;
    main_loop:
        call clockDelay
        call stdioReadChar
        call execCommand

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
;; #include config/commands.asm
;; #include config/sprites.asm
;; #include config/general.asm
