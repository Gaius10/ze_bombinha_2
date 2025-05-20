CLOCK_LSB: var #1
CLOCK_MSB: var #1

;;
;; Configura inicialização do clock
;;
;; 40k * 25 == 1M
;; 1M de iterações por segundo, num processador de 1MHz
;; Em outros processadores, ajustar esse número de acordo.
;;
static CLOCK_LSB, #40000
static CLOCK_MSB, #25

