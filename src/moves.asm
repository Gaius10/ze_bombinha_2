;; requires src/stdio.asm

command_MoveUp:
    push r1
    push r2

    ;; Atualiza posição anterior
    load r1, current_pos
    store previous_pos, r1

    ;; Atualiza posição atual
    loadn r2, #40
    sub r1, r1, r2
    store current_pos, r1

    call printPlayer
    pop r2
    pop r1
    rts

command_MoveDown:
    push r1
    push r2

    ;; Atualiza posição anterior
    load r1, current_pos
    store previous_pos, r1

    ;; Atualiza posição atual
    loadn r2, #40
    add r1, r1, r2
    store current_pos, r1

    call printPlayer

    pop r2
    pop r1
    rts

command_MoveLeft:
    push r1
    push r2

    ;; Atualiza posição anterior
    load r1, current_pos
    store previous_pos, r1

    ;; Atualiza posição atual
    loadn r2, #1
    sub r1, r1, r2
    store current_pos, r1

    call printPlayer

    pop r2
    pop r1
    rts

command_MoveRight:
    push r1
    push r2

    ;; Atualiza posição anterior
    load r1, current_pos
    store previous_pos, r1

    ;; Atualiza posição atual
    loadn r2, #1
    add r1, r1, r2
    store current_pos, r1

    call printPlayer

    pop r2
    pop r1
    rts

