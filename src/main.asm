jmp main

;; ####
;; Command constants
;;
COMMAND_MOVE_UP: var #1
COMMAND_MOVE_DOWN: var #1
COMMAND_MOVE_LEFT: var #1
COMMAND_MOVE_RIGHT: var #1

;; ####
;; Control variables
;;
current_pos: var #1
previous_pos: var #1

main:
    loadn r1, #620
    store current_pos, r1
    call printPlayer

    main_loop:
        call loadCommands
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

loadCommands:
    push r1

    loadn r1, #'w'
    store COMMAND_MOVE_UP, r1

    loadn r1, #'a'
    store COMMAND_MOVE_LEFT, r1

    loadn r1, #'s'
    store COMMAND_MOVE_DOWN, r1

    loadn r1, #'d'
    store COMMAND_MOVE_RIGHT, r1

    pop r1
    rts

;; #include src/stdio.asm
;; #include src/moves.asm
