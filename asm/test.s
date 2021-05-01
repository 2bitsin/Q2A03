.org $c000
.segment "CODE"
G_screen = $4800
init:
  lda #'H'
  sta G_screen + 0
  lda #'e'
  sta G_screen + 1
  lda #'l'
  sta G_screen + 2
  lda #'l'
  sta G_screen + 3
  lda #'o'
  sta G_screen + 4
  lda #' '
  sta G_screen + 5
  lda #'W'
  sta G_screen + 6
  lda #'o'
  sta G_screen + 7
  lda #'r'
  sta G_screen + 8
  lda #'l'
  sta G_screen + 9
  lda #'d'
  sta G_screen + 10
  lda #'!'
  sta G_screen + 11

  .byte $f2

.segment "VECTORS"  
.addr init
.addr init
.addr init