;; #requires src/stdio.asm

animate:
    call animatePlayerOne
    ; call animateMonsters
    ; call animateBombs
    rts

animatePlayerOne:
    push r0
    push r1
    push r2
    push r6
    push r7

    ;; se estiver parado, retorna
    load r0, player_one_state
    loadn r1, #0
    cmp r0, r1
    jeq _animatePlayerOne_pop

    ;; se movendo para cima
    _animatePlayerOne_up:
        loadn r1, #1
        cmp r0, r1
        jne _animatePlayerOne_down

        load r6, current_pos
        loadn r7, #SPRITE_PLAYER_ONE_COSTAS
        call stdioPrintSprite

        jmp _animatePlayerOne_pop

    ;; se movendo para baixo
    _animatePlayerOne_down:
        loadn r1, #2
        cmp r0, r1
        jne _animatePlayerOne_left

        load r6, current_pos
        loadn r7, #SPRITE_PLAYER_ONE_FRENTE
        call stdioPrintSprite

        jmp _animatePlayerOne_pop

    ;; se movendo para esquerda
    _animatePlayerOne_left:
        loadn r1, #3
        cmp r0, r1
        jne _animatePlayerOne_right

        ;; A depender do momento, varia sprite apresentado
        load r0, clock
        loadn r1, #2
        mod r2, r0, r1
        jz _animatePlayerOne_left_2

        _animatePlayerOne_left_1:
            load r6, current_pos
            loadn r7, #SPRITE_PLAYER_ONE_ESQUERDA
            call stdioPrintSprite

            jmp _animatePlayerOne_pop
        _animatePlayerOne_left_2:
            load r6, current_pos
            loadn r7, #SPRITE_PLAYER_ONE_ESQUERDA_ANDANDO
            call stdioPrintSprite

            jmp _animatePlayerOne_pop

    ;; se movendo para direita
    _animatePlayerOne_right:
        loadn r1, #4
        cmp r0, r1
        jne _animatePlayerOne_pop

        ;; A depender do momento, varia sprite apresentado
        load r0, clock
        loadn r1, #2
        mod r2, r0, r1
        jz _animatePlayerOne_right_2

        _animatePlayerOne_right_1:
            load r6, current_pos
            loadn r7, #SPRITE_PLAYER_ONE_DIREITA
            call stdioPrintSprite

            jmp _animatePlayerOne_pop
        _animatePlayerOne_right_2:
            load r6, current_pos
            loadn r7, #SPRITE_PLAYER_ONE_DIREITA_ANDANDO
            call stdioPrintSprite

            jmp _animatePlayerOne_pop

    _animatePlayerOne_pop:
    pop r7
    pop r6
    pop r2
    pop r1
    pop r0
    rts
