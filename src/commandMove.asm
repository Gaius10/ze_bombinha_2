;; requires src/stdio.asm

commandMoveUp:
    push r1
    push r6
    push r7

    ;; Limpa tela
    load r6, previous_pos
    loadn r7, #SPRITE_VAZIO
    call stdioPrintSprite

    ;; Atualiza posição anterior
    load r6, current_pos
    store previous_pos, r6

    ;; Atualiza posição atual
    loadn r1, #40
    sub r6, r6, r1
    store current_pos, r6

    ;; Desenha na tela
    loadn r7, #SPRITE_PLAYER_ONE
    call stdioPrintSprite

    pop r7
    pop r6
    pop r1
    rts

commandMoveDown:
    push r1
    push r6
    push r7

    ;; Limpa tela
    load r6, previous_pos
    loadn r7, #SPRITE_VAZIO
    call stdioPrintSprite

    ;; Atualiza posição anterior
    load r6, current_pos
    store previous_pos, r6

    ;; Atualiza posição atual
    loadn r1, #40
    add r6, r6, r1
    store current_pos, r6

    ;; Desenha na tela
    loadn r7, #SPRITE_PLAYER_ONE
    call stdioPrintSprite

    pop r7
    pop r6
    pop r1
    rts

commandMoveLeft:
    push r6
    push r7

    ;; Limpa tela
    load r6, previous_pos
    loadn r7, #SPRITE_VAZIO
    call stdioPrintSprite

    ;; Atualiza posição anterior
    load r6, current_pos
    store previous_pos, r6

    ;; Atualiza posição atual
    dec r6
    store current_pos, r6

    ;; Desenha na tela
    loadn r7, #SPRITE_PLAYER_ONE
    call stdioPrintSprite

    pop r7
    pop r6
    rts

commandMoveRight:
    push r6
    push r7

    ;; Limpa tela
    load r6, previous_pos
    loadn r7, #SPRITE_VAZIO
    call stdioPrintSprite

    ;; Atualiza posição anterior
    load r6, current_pos
    store previous_pos, r6

    ;; Atualiza posição atual
    inc r6
    store current_pos, r6

    ;; Desenha na tela
    loadn r7, #SPRITE_PLAYER_ONE
    call stdioPrintSprite

    pop r7
    pop r6
    rts
