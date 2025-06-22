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

    ;; ########
    ; recupera posição atual
    load r6, current_pos
    ;; ########

    ;; ########
    ; calcula prox posição
    ; r2 = current_pos - 40
    loadn r1, #40
    sub r2, r6, r1
    ;; ########

    ; free r1

    ;; ########
    ; testa se prox posição está disponível para movimento
    ; r0 = scenarioGetSpriteOfPos(current_pos)
    mov r7, r2
    call scenarioGetSpriteOfPos
    ;; ########

    ; if r0 == '#' return
    load r1, sprite_tag_common_wall
    cmp r0, r1
    jeq _commandmoveup_end

    ; if r0 == '@' return
    load r1, sprite_tag_unbreakable_wall
    cmp r0, r1
    jeq _commandmoveup_end
    ;; ########

    ; free r0
    ; free r1
    ; free r7

    ;; ########
    ; limpa tela
    ;; r5 carrega o mapa de cenário com as bombas com todos os pixos
    loadn r5, #scenario_bomba
    ;; r6 carrega posição atual
    load r6, current_pos
    ;;muda de linha verticalmente
    loadn r4, #40
    ;; checa posição do personagem no mapa de cenário
    add r5, r5, r6 
    ;; carrega em r7 o que está presente no mapa de cenário (vazio | bomba)
    loadi r7, r5
    ;; funcionamento igual o stdioprintsprite
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

    ;; ########
    ; atualiza posição atual
    store current_pos, r2
    ;; ########

    ;; ########
    ; desenha na tela
    ; stdioprintsprite(r6: pos, r7: sprite)
    mov r6, r2
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

    pop r7
    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    rts