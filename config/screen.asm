;; ###########################
;; Mapa de referência:
;;
;; ' ' -> Vazio
;; '#' -> Tijolo quebrável
;; '@' -> Tijolo inquebrável
;;

SPRITE_TAG_VOID: var #1
SPRITE_TAG_COMMON_WALL: var #1
SPRITE_TAG_UNBREAKABLE_WALL: var #1

;; ########
;; Cenario 1
CENARIO1_L01: string "####################"
CENARIO1_L02: string "#                  #"
CENARIO1_L03: string "#                  #"
CENARIO1_L04: string "#                  #"
CENARIO1_L05: string "#                  #"
CENARIO1_L06: string "#                  #"
CENARIO1_L07: string "#                  #"
CENARIO1_L08: string "#                  #"
CENARIO1_L09: string "#                  #"
CENARIO1_L10: string "#                  #"
CENARIO1_L11: string "#               @  #"
CENARIO1_L12: string "#                  #"
CENARIO1_L13: string "#                  #"
CENARIO1_L14: string "#                  #"
CENARIO1_L15: string "####################"
;; ########

static SPRITE_TAG_VOID, #' '
static SPRITE_TAG_COMMON_WALL, #'#'
static SPRITE_TAG_UNBREAKABLE_WALL, #'@'
