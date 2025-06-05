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
    call initGameCenario

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
initGameCenario:
    push r1
    push r2
    push r3
    push r4
    push r5
    push r7

    loadn r3, #scenario_map
    loadn r4, #0            ;; Numero de linhas desenhadas
    loadn r5, #15           ;; Numero máximo de linhas

    _initGameCenario_loop:
        ;; r7 -> i
        ;; r1 -> cenario[i]
        ;;
        ;; if (cenario[i] != '\0') goto load
        loadi r1, r7
        loadn r2, #'\0'
        cmp r1, r2
        jne _initGameCenario_loop_load

        ;; else i++
        inc r7
        loadi r1, r7
        inc r4

        _initGameCenario_loop_load:
            ;; scenario_map[i] = cenario[i]
            storei r3, r1
            inc r3
            inc r7

        ;; if (linhas < 15) goto loop
        cmp r4, r5
        jle _initGameCenario_loop

    pop r7
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    rts

initGameDraw:
    _initGameDrawLoop:
        ;; @todo
    rts