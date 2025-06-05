;;
;; Atualiza relógio (variável clock)
;;
;; Para alterar o tempo de delay, alterar configurações CLOCK_MSB e CLOCK_LSB
;; no arquivo config/general.asm
;;
clockDelay:
    push r7
    push r6
    push r5

    ;;
    ;; Decrementa LSB
    ;; Quando LSB == 0, decrementa MSB e reseta LSB
    ;; Quando MSB == 0, termina
    ;; Repete
    ;;

    load r7, CLOCK_LSB
    load r6, CLOCK_MSB

    _clock_tic_tac:
        dec r7
        jnz _clock_tic_tac

        load r7, CLOCK_LSB
        dec r6
        jnz _clock_tic_tac

    load r5, clock
    inc r5
    store clock, r5

    pop r5
    pop r6
    pop r7
    rts
