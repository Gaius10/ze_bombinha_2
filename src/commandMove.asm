;; requires src/stdio.asm
;; requires src/scenario.asm

commandmoveup:
    push r1
    push r2
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
    ; stdioprintsprite(r6: pos, r7: sprite)
    loadn r7, #sprite_vazio
    call stdioprintsprite
    ;; ########

    ;; ########
    ; atualiza posição atual
    store current_pos, r2
    ;; ########

    ;; ########
    ; desenha na tela
    ; stdioprintsprite(r6: pos, r7: sprite)
    mov r6, r2
    loadn r7, #sprite_player_one_costas
    call stdioprintsprite
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
    pop r2
    pop r1
    rts

commandmovedown:
    push r1
    push r6
    push r7

    ;; limpa tela
    load r6, current_pos
    loadn r7, #sprite_vazio
    call stdioprintsprite

    ;; atualiza posição atual
    loadn r1, #40
    add r6, r6, r1
    store current_pos, r6

    ;; desenha na tela
    loadn r7, #sprite_player_one_frente
    call stdioprintsprite

    ;; atualiza player state
    loadn r1, #2
    store player_one_state, r1

    pop r7
    pop r6
    pop r1
    rts

commandmoveleft:
    push r6
    push r7

    ;; limpa tela
    load r6, current_pos
    loadn r7, #sprite_vazio
    call stdioprintsprite

    ;; atualiza posição atual
    dec r6
    store current_pos, r6

    ;; desenha na tela
    loadn r7, #sprite_player_one_esquerda
    call stdioprintsprite

    ;; atualiza player state
    loadn r1, #3
    store player_one_state, r1

    pop r7
    pop r6
    rts

commandmoveright:
    push r6
    push r7

    ;; limpa tela
    load r6, current_pos
    loadn r7, #sprite_vazio
    call stdioprintsprite

    ;; atualiza posição atual
    inc r6
    store current_pos, r6

    ;; desenha na tela
    loadn r7, #sprite_player_one_direita
    call stdioprintsprite

    ;; atualiza player state
    loadn r1, #4
    store player_one_state, r1

    pop r7
    pop r6
    rts
