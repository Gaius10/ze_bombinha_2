;; comando pra colocar a bomba no jogo

commandBomba:

    push r6
    push r5
    push r7

    loadn r5, #scenario_map
    load r6, current_pos
    loadn r7, #'B'
    loadn r4, #40
    div r6, r6, r4

    add r5, r5, r6

    storei r5, r7


    pop r7
    pop r5
    pop r6
    rts