.org $8000
.segment "CODE"
init:
  lda #'H'
  sta $7e00
  lda #'e'
  sta $7e01
  lda #'l'
  sta $7e02
  lda #'l'
  sta $7e03
  lda #'o'
  sta $7e04
  lda #' '
  sta $7e05
  lda #'W'
  sta $7e06
  lda #'o'
  sta $7e07
  lda #'r'
  sta $7e08
  lda #'l'
  sta $7e09
  lda #'d'
  sta $7e0a
  lda #'!'
  sta $7e0b

  .byte $f2

.segment "VECTORS"  
.addr init
.addr init
.addr init