;;
;; Inicializa todas as variáveis necessárias.
;; Essa função deve ser chamada apenas uma vez, no início de cada jogo.
;;
initGame:
    push r0
    push r6
    push r7

    ;; Carrega mapa de cenário
    loadn r2, #CENARIO1_L01
    call initGameCenario

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

initGameCenario:
   
    push r0 ;; verificar se terminou a tela
    push r1 ;; leitor das strings
    push r2 ;; carrega as strings
    push r3 ;; pular de uma string pra outra 
    push r4 ;; carrega o comparador pra saber se tem objeto
    push r5 ;; carrega o critério de parada '/0'
    push r6 ;; carrega a posição 
    push r7 ;; carrega os sprites

    loadn r5, #'\0'
    loadn r3, #40                             ;; pula pra proxima linha 
    loadn r6, #0
    loadn r4, #'#'
    loadn r0, #1158                           ;; penultimo pixel da penultima linha

    initGameCenarioLoop:
        cmp r6, r0
        jgr initGameCenarioFim                ;; se r6 > 1158 termina
        loadi r1, r2
        cmp r1, r5                            ;; compara com '\0' final da string
        jeq initGameCenarioFimString          
        cmp r1, r4                            ;; compara com '#' pra saber se tem um obstaculo
        jeq initGameDraw                      ;; chama a função pra desenhar o bloco
        jmp printVazio                        ;; se nao tiver bloco imprime um 2x2 vazio = ' '

    initGameCenarioFimString:

        inc r2                                ;; pula o \0
        add r6, r6, r3                        ;; pula a posição na tela pra linha de baixo
        jmp initGameCenarioLoop 
    
    printVazio:
        loadn r7, #SPRITE_VAZIO       
        call stdioPrintSprite
        inc r6      
        inc r6                                ;; incrementa 2 vezes pra pular um bloco 
        inc r2
        jmp initGameCenarioLoop

    initGameDraw: 
  
        loadn r7, #SPRITE_TIJOLO 
        call stdioPrintSprite
        inc r2
        inc r6
        inc r6
        jmp initGameCenarioLoop

    initGameCenarioFim:

    pop r7
    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    
    rts

