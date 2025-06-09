;; #requires src/stdio.asm

;;
;; Inicializa todas as variáveis necessárias.
;; Essa função deve ser chamada apenas uma vez, no início de cada jogo.
;;
initGame:
    push r0
    push r6
    push r7

    ;; Carrega mapa de cenário
    loadn r7, #CENARIO1_L01
    call initGameScenario

    ;; Desenha tela inicial
    call initGameDraw

    ;; Inicializa player state parado
    loadn r0, #0
    store player_one_state, r0

    ;; Carrega player na posição inicial
    loadn r6, #620
    store current_pos, r6
    loadn r7, #SPRITE_PLAYER_ONE_FRENTE
    call stdioPrintSprite

    pop r7
    pop r6
    pop r0
    rts

;;
;; @param r7 endereço do início da primeira linha do cenário
;;
initGameScenario:
    push r1
    push r2
    push r3
    push r4
    push r5
    push r7

    loadn r3, #scenario_map
    loadn r4, #0            ;; Numero de linhas desenhadas
    loadn r5, #15           ;; Numero máximo de linhas

    _initGameScenario_loop:
        ;; r7 -> i
        ;; r1 -> cenario[i]
        ;;
        ;; if (cenario[i] != '\0') goto load
        loadi r1, r7
        loadn r2, #'\0'
        cmp r1, r2
        jne _initGameScenario_loop_store

        ;; else i++
        inc r7
        loadi r1, r7
        inc r4

        _initGameScenario_loop_store:
            ;; scenario_map[i] = cenario[i]
            storei r3, r1
            inc r3
            inc r7

        ;; if (linhas < 15) goto loop
        cmp r4, r5
        jle _initGameScenario_loop

    pop r7
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    rts

initGameDraw:
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6
    push r7

    loadn r1, #20               ;; utilitario
    loadn r2, #80               ;; utilitario
    loadn r3, #2                ;; utilitario

    loadn r4, #scenario_map
    loadn r5, #0               ;; contador de pixos renderizados

    _initGameDraw_loop:
        ;; ######
        ; num_linha: r6 = r5 / 20
        div r6, r5, r1
        ;; ######

        ;; ######
        ; num_coluna: r0 = r5 % 20
        mod r0, r5, r1
        ;; ######

        ;; ######
        ; posicao_real: r6 = num_linha*80 + num_coluna*2
        mul r6, r6, r2
        mul r0, r0, r3
        add r6, r6, r0
        ;; ######

        ;; ######
        ; carregar sprite
        ; r0 = initSpriteMap(r7)
        ; ou, equivalentemente,
        ; r0 = #<SPRITE>
        loadi r7, r4
        call initSpriteMap
        ;; ######

        ;; ######
        ; printar sprite
        ; stdioPrintSprite(r6: pos, r7: sprite)
        mov r7, r0
        call stdioPrintSprite
        ;; ######

        ;; ######
        ; restaura valor do r7
        pop r7
        push r7
        ;; ######

        ;; ######
        ; if r5 < 300 goto loop
        inc r4
        inc r5
        loadn r0, #300
        cmp r5, r0
        jle _initGameDraw_loop
        ;; ######

    pop r7
    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    rts

;;
;; Carrega sprite que deverá ser mostrado na tela
;;
;; @param  r7 caracter a ser convertido
;; @return r0 endereço do primeiro pixo do sprite
;;
initSpriteMap:
    push r1

    ;; if (char == ' ') return vazio
    _initSpriteMap_caseVoid:
        loadn r1, #' '
        cmp r1, r7
        jne _initSpriteMap_caseCommonWall

        loadn r0, #SPRITE_VAZIO
        jmp _initSpriteMap_end

    ;; if (char == '#') return parede_quebravel
    _initSpriteMap_caseCommonWall:
        loadn r1, #'#'
        cmp r1, r7
        jne _initSpriteMap_caseUnbreakableWall

        loadn r0, #SPRITE_TIJOLO
        jmp _initSpriteMap_end

    ;; if (char == '@') return parede_inquebravel
    _initSpriteMap_caseUnbreakableWall:
        loadn r1, #'@'
        cmp r1, r7
        jne _initSpriteMap_caseNoop

        loadn r0, #SPRITE_TIJOLO_INQUEBRAVEL
        jmp _initSpriteMap_end

    ;; @todo proximos casos...
    _initSpriteMap_caseNoop:
        ;; @todo colocar aqui as proximas comparacoes
        ;; (por favor, tenha a decencia de renomear "Noop" para algo que idenfique seu sprite)

    _initSpriteMap_end:
        ;;

    pop r1
    rts
