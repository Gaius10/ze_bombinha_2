jmp main

;; ####
;; Control variables
;;
current_pos: var #1
previous_pos: var #1
current_frame: var #1

main:
    call init ;; src/init.asm

    ;;
    ;; Loop principal
    ;;
    main_loop:
        call clock        ;; src/clock.asm
        call readChar     ;; src/stdio.asm
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

;; #include src/init.asm
;; #include src/stdio.asm
;; #include src/clock.asm
;; #include src/moves.asm
;; #include config/commands.asm
;; #include config/sprites.asm
;; #include config/general.asm
