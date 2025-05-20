jmp main

;; ####
;; Control variables
;;
current_pos: var #1
previous_pos: var #1

main:
    loadn r1, #620
    store current_pos, r1
    loadn r7, #SPRITE_PLAYER_ONE
    call printPlayer

    main_loop:
        call readChar        ;; stdio.asm
        call execCommand

        jmp main_loop
    halt

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
