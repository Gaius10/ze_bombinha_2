;; ###########################
;; Mapa de referência:
;;
;; ' ' -> Vazio
;; '#' -> Tijolo quebrável
;; '@' -> Tijolo inquebrável
;;

SPRITE_TAG_VOID: var #1
sprite_tag_common_wall: var #1
sprite_tag_unbreakable_wall: var #1

;; ########
;; Cenario 1
CENARIO1_L01: string "####################"
CENARIO1_L02: string "#  @  @  @  @  @   #"
CENARIO1_L03: string "#                  #"
CENARIO1_L04: string "#  @  @  @  @  @   #"
CENARIO1_L05: string "#                  #"
CENARIO1_L06: string "#  @  @  @  @  @   #"
CENARIO1_L07: string "#                  #"
CENARIO1_L08: string "#  @  @  @  @  @   #"
CENARIO1_L09: string "#                  #"
CENARIO1_L10: string "#  @  @  @  @  @   #"
CENARIO1_L11: string "#                  #"
CENARIO1_L12: string "#  @  @  @  @  @   #"
CENARIO1_L13: string "#                  #"
CENARIO1_L14: string "#  @  @  @  @  @   #"
CENARIO1_L15: string "####################"
;; ########

static SPRITE_TAG_VOID, #' '
static sprite_tag_common_wall, #'#'
static sprite_tag_unbreakable_wall, #'@'
