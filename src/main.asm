jmp main

;; ####
;; Command variables
;;
command_move_up: var #1
command_move_down: var #1
command_move_left: var #1
command_move_right: var #1

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

    load r1, command_move_up
    cmp r0, r1
    ceq command_MoveUp

    load r1, command_move_down
    cmp r0, r1
    ceq command_MoveDown

    load r1, command_move_left
    cmp r0, r1
    ceq command_MoveLeft

    load r1, command_move_right
    cmp r0, r1
    ceq command_MoveRight

    pop r1
    pop fr
    rts

loadCommands:
    push r1

    loadn r1, #'w'
    store command_move_up, r1

    loadn r1, #'a'
    store command_move_left, r1

    loadn r1, #'s'
    store command_move_down, r1

    loadn r1, #'d'
    store command_move_right, r1

    pop r1
    rts

;; #include src/stdio.asm
;; #include src/moves.asm
