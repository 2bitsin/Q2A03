.org $c000
.segment "CODE"

G_screen  = $60C8 
G_screen2 = $60A8 

Main:
  ldx #$00
  txs 
@again:
  ldx #$00  
@forever:
  lda hello_string,x
  sta G_screen2,x
  beq @again  
  inx
  jmp @forever

  
Interrupt_nmi:
  pha
  txa
  pha
  tya
  pha
  ldx frame_count
  txa 
  inx
  stx frame_count
  ldx #$00
  and #$08
  bne @clear
@print:
  lda hello_string,x
  beq @exit
  sta G_screen, x
  inx   
  jmp @print
@clear:
  lda hello_erase,x
  beq @exit
  sta G_screen, x
  inx
  jmp @clear
@exit:
  pla
  tay
  pla
  tax
  pla
  rti

.segment "RODATA"

frame_count:
  .byte 0

hello_string:
  .byte "Hello World!", 0

hello_erase:
  .byte "            ", 0

.segment "VECTORS"  
  .addr Interrupt_nmi
  .addr Main
  .addr Main