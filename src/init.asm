;;
;; Inicializa todas as variáveis necessárias.
;; Essa função deve ser chamada apenas uma vez, no início de cada jogo.
;;
init:
    push r7
    push r1

    ;; Carrega player na posição inicial
    loadn r1, #620
    store current_pos, r1
    loadn r7, #SPRITE_PLAYER_ONE
    call printPlayer

    pop r1
    pop r7
    rts
