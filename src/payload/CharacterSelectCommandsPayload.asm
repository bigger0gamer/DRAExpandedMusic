.psx

RandomMusic:
  lui v1,hi(MusicRNGVar)
  lw v1,lo(MusicRNGVar)(v1)
  beq v0,r0,@@ArcadeMusic
  slti v0,v1,0xA
  beq v0,r0,@@NoArcadeMusic
  addi v0,r0,6
  beq v0,v1,@@NoArcadeMusic
  nop
  @@ArcadeMusic:
  j ArcadeMusicReturn
  add v0,r0,r0
  @@NoArcadeMusic:
  slti v0,v1,16
  bne v0,r0,@@NotCustom
  nop
  addi v1,v1,0x69  ; nice :D
  @@NotCustom:
  j RandomMusicReturn
  addi t0,v1,0x0
