;; ########
;;
;; Converte posição em r7 para a posição equivalente no mapa de cenário
;;
;; @param r7  posicão (real) a ser convertida
;; @return r0 posição (no mapa)
;;
scenarioPosToMap:
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6
    push r7

    loadn r3, #40
    loadn r5, #2
    ;; r1 = pos / 40
    div r1, r2, r3
    ;; r4 = pos / 2
    div r4, r2, r5
    loadn r6, #10
    mul r1, r1, r6
    sub r4, r4, r1
    loadn r7, #scenario_map
    add r7, r7, r4
    loadi r0, r7

    pop r7
    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    rts

;; ########
;;
;; Converte posição em r7 para posição equivalente na tela real
;;
;; @param r7  posicão (no mapa) a ser convertida
;; @return r0 posição (real)
;;
scenarioMapToPos:
    rts

;; ########
;;
;; Retorna tag do sprite na posição (real) r7
;;
;; @param r7  posicão (no mapa) a ser convertida
;; @return r0 tag do sprite
;;
scenarioGetSpriteOfPos:
    ;; @todo isso aqui é o proximo passo
    rts
