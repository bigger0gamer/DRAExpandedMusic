.psx

RNG:
  ; Music RNG
  lui ra,hi(MusicRNGVar)
  lw ra,lo(MusicRNGVar)(ra)
  sw v0,0x00a4(s0)  ; original instruction
  addi ra,ra,0x1    ; MusicRNG++
  slti v0,ra,16+6   ; if(MusicRNG !< 0x10)
  bne v0,r0,@@Return
  nop
  addi ra,ra,-10-6    ; then(MusicRNG -= 10)
  
  @@Return:
  j RNGReturn
  sw ra,lo(MusicRNGVar)(v0)
