;; requires src/stdio.asm
;; requires src/scenario.asm

commandmoveup:
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6
    push r7

    ; free r0
    ; free r1
    ; free r2
    ;;loadn r3, #scenario_bomba
    ;; ########
    ; recupera posição atual
    load r6, current_pos
    ;; ########
    loadn r3, #2
    loadn r4, #40


    div r2, r6, r4
    mod r2, r2, r3
    jnz continuaUp



    sub r2, r6, r4
    sub r2, r2, r4
    call scenarioPosToMap
    loadn r2, #'#'
    cmp r0, r2
    jeq _commandmoveup_end
    loadn r2, #'@'
    cmp r0, r2
    jeq _commandmoveup_end

    inc r6

    sub r2, r6, r4
    sub r2, r2, r4
    call scenarioPosToMap
    loadn r2, #'#'
    cmp r0, r2
    jeq _commandmoveup_end
    loadn r2, #'@'
    cmp r0, r2
    jeq _commandmoveup_end


    ;; ########
    ; calcula prox posição
    ; r2 = current_pos - 40

    ;; ########
    ; free r1

    ;; ########
    ; testa se prox posição está disponível para movimento
    ; r0 = scenarioGetSpriteOfPos(current_pos)

    ;; ########

    ; free r0
    ; free r1
    ; free r7

    ;; ########
    ; limpa tela
    ; stdioprintsprite(r6: pos, r7: sprite)

continuaUp:

    loadn r5, #scenario_bomba
    load r6, current_pos
    loadn r4, #40
    add r5, r5, r6 
    loadi r7, r5
    outchar r7, r6
    inc r5
    inc r6
    loadi r7, r5
    outchar r7, r6
    add r5, r5, r4
    add r6, r6, r4
    loadi r7, r5
    outchar r7, r6
    dec r5
    dec r6
    loadi r7, r5
    outchar r7, r6
    ;; ########
    load r6, current_pos
    sub r6, r6, r4

    ;; ########
    ; atualiza posição atual
    store current_pos, r6
    ;; ########

    ;; ########
    ; desenha na tela
    ; stdioprintsprite(r6: pos, r7: sprite)
    loadn r7, #SPRITE_PLAYER_ONE_COSTAS
    call stdioPrintSprite
    ;; ########

    ;; ########
    ; atualiza player state
    loadn r1, #1
    store player_one_state, r1
    ;; ########

_commandmoveup_end:
        ;;

    pop r7
    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    rts

commandmovedown:
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6
    push r7


    load r6, current_pos

    loadn r3, #2
    loadn r4, #40


    div r2, r6, r4
    mod r2, r2, r3
    jnz continuaDown


    add r2, r6, r4
    add r2, r2, r4
    call scenarioPosToMap
    loadn r2, #'#'
    cmp r0, r2
    jeq _commandmovedown_end
    loadn r2, #'@'
    cmp r0, r2
    jeq _commandmovedown_end

    inc r6
    
    add r2, r6, r4
    add r2, r2, r4
    call scenarioPosToMap
    loadn r2, #'#'
    cmp r0, r2
    jeq _commandmovedown_end
    loadn r2, #'@'
    cmp r0, r2
    jeq _commandmovedown_end



continuaDown:
    ;; limpa tela
    loadn r5, #scenario_bomba
    load r6, current_pos
    loadn r4, #40
    add r5, r5, r6 
    loadi r7, r5
    outchar r7, r6
    inc r5
    inc r6
    loadi r7, r5
    outchar r7, r6
    add r5, r5, r4
    add r6, r6, r4
    loadi r7, r5
    outchar r7, r6
    dec r5
    dec r6
    loadi r7, r5
    outchar r7, r6

    ;; atualiza posição atual
    load r6, current_pos
    loadn r1, #40
    add r6, r6, r1
    store current_pos, r6

    ;; desenha na tela
    loadn r7, #SPRITE_PLAYER_ONE_FRENTE
    call stdioPrintSprite

    ;; atualiza player state
    loadn r1, #2
    store player_one_state, r1

_commandmovedown_end:
    pop r7
    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    rts

commandmoveleft:
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6
    push r7

    load r6, current_pos

    loadn r4, #40
    loadn r3, #2

    mod r2, r6, r3
    jnz continuaLeft
    div r2, r6, r4
    mod r2, r2, r3
    jnz linha_imparL

    sub r2, r6, r3
    call scenarioPosToMap
    loadn r2, #'#'
    cmp r0, r2
    jeq _commandmoveleft_end
    loadn r2, #'@'
    cmp r0, r2
    jeq _commandmoveleft_end
    jmp continuaLeft

linha_imparL:

    sub r2, r6, r4
    
    dec r2
    dec r2
    call scenarioPosToMap
    loadn r2, #'#'
    cmp r0, r2
    jeq _commandmoveleft_end
    loadn r2, #'@'
    cmp r0, r2
    jeq _commandmoveleft_end

    add r2, r6, r4
    
    dec r2
    dec r2
    call scenarioPosToMap
    loadn r2, #'#'
    cmp r0, r2
    jeq _commandmoveleft_end
    loadn r2, #'@'
    cmp r0, r2
    jeq _commandmoveleft_end

    

continuaLeft:
    ;; limpa tela
    loadn r5, #scenario_bomba
    load r6, current_pos
    loadn r4, #40
    add r5, r5, r6 
    loadi r7, r5
    outchar r7, r6
    inc r5
    inc r6
    loadi r7, r5
    outchar r7, r6
    add r5, r5, r4
    add r6, r6, r4
    loadi r7, r5
    outchar r7, r6
    dec r5
    dec r6
    loadi r7, r5
    outchar r7, r6

    ;; atualiza posição atual
    load r6, current_pos
    dec r6
    store current_pos, r6

    ;; desenha na tela
    loadn r7, #SPRITE_PLAYER_ONE_ESQUERDA
    call stdioPrintSprite

    ;; atualiza player state
    loadn r1, #3
    store player_one_state, r1


    _commandmoveleft_end:
    pop r7
    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    rts

commandmoveright:
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6
    push r7


    load r6, current_pos

    loadn r4, #40
    loadn r3, #2

    mod r2, r6, r3
    jnz continuaRight
    div r2, r6, r4
    mod r2, r2, r3
    jnz linha_imparR

    add r2, r6, r3
    call scenarioPosToMap
    loadn r2, #'#'
    cmp r0, r2
    jeq _commandmoveright_end
    loadn r2, #'@'
    cmp r0, r2
    jeq _commandmoveright_end
    jmp continuaRight

linha_imparR:

    sub r2, r6, r4
    
    inc r2
    inc r2
    call scenarioPosToMap
    loadn r2, #'#'
    cmp r0, r2
    jeq _commandmoveright_end
    loadn r2, #'@'
    cmp r0, r2
    jeq _commandmoveright_end

    add r2, r6, r4
    
    inc r2
    inc r2
    call scenarioPosToMap
    loadn r2, #'#'
    cmp r0, r2
    jeq _commandmoveright_end
    loadn r2, #'@'
    cmp r0, r2
    jeq _commandmoveright_end



continuaRight:
    ;; limpa tela
    loadn r5, #scenario_bomba
    load r6, current_pos
    loadn r4, #40
    add r5, r5, r6 
    loadi r7, r5
    outchar r7, r6
    inc r5
    inc r6
    loadi r7, r5
    outchar r7, r6
    add r5, r5, r4
    add r6, r6, r4
    loadi r7, r5
    outchar r7, r6
    dec r5
    dec r6
    loadi r7, r5
    outchar r7, r6

    ;; atualiza posição atual
    load r6, current_pos
    inc r6
    store current_pos, r6

    ;; desenha na tela
    loadn r7, #SPRITE_PLAYER_ONE_DIREITA
    call stdioPrintSprite

    ;; atualiza player state
    loadn r1, #4
    store player_one_state, r1

    _commandmoveright_end:

    pop r7
    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    rts
