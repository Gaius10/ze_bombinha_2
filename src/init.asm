;;
;; Inicializa todas as variáveis necessárias.
;; Essa função deve ser chamada apenas uma vez, no início de cada jogo.
;;
initGame:
    push r0
    push r6
    push r7

    ;; Carrega mapa de cenário
    call initGameCenario

    ;; Desenha tela inicial
    call initGameDraw

    ;; Inicializa player state parado
    loadn r0, #0
    store player_state, r0

    ;; Carrega player na posição inicial
    loadn r6, #620
    store current_pos, r6
    loadn r7, #SPRITE_PLAYER_ONE_FRENTE
    call stdioPrintSprite

    pop r7
    pop r6
    pop r0
    rts

initGameCenario:
    _initGameCenarioLoop:
        ;; @todo
    rts

initGameDraw:
    _initGameDrawLoop:
        ;; @todo
    rts
