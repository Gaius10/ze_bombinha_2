;; ########
;;
;; Converte posição em r7 para a posição equivalente no mapa de cenário
;;
;; @param r7  posicão (real) a ser convertida
;; @return r0 posição (no mapa)
;;
scenarioPosToMap:
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
