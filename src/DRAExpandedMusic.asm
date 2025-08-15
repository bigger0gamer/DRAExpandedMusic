; Digimon Rumble Arena: Expanded Music
; created by Yuri Bacon
;   but wouldn't be possible without Nagtan's XAPacker
; This is basically just TrueOGEdition but with everything cut out except Random Music
; and a small selection of QoL features: Everything Unlocked, Always Allow Mirror Matches,
; Remove 5 Round Limit, and Bottom Row Evos In Arcade Mode.
.psx



; SLUS_014.04, anything that needs to be inserted into the main executable or payload goes here
.openfile "../build env/Digimon Rumble Arena (USA)/SLUS_014.04.bak","../build env/Digimon Rumble Arena (USA)/SLUS_014.04",0x8000F800

  ; Custom Variable Labels
   ; Constants
   NumberSongs equ NUMBER_SONGS
   .org 0x80037010 :: RNGFunc:
   .org 0x8005EE48 :: RNGPointer:
   
   ; 1 byte vars
   .org 0x801FC8F0 :: Color1PVar:
   .org 0x801FC8F1 :: Color2PVar:
   
   ; 4 byte vars
   .org 0x801FC900 :: CharacterRNGHistory:
   .org 0x801FC904 :: StageRNGHistory:
   .org 0x801FC908 :: MusicRNGHistory:
  
  
  ; First, we need to start with any data that needs to be modified in SLUS_014.04 itself
  .include "exe/EverythingUnlockedExe.asm"
  .include "exe/RandomMusicExe.asm"
  .include "exe/AltColorExe.asm"
  
  
  ; As most of the game's code can't be resized,
  ; anything that needs extra data has to be stored somewhere else, in unused RAM.
  ; It's stored in empty space at the end of the exe, and this code moves that "payload".
  ; From now, until we close this file, we cannot use .org anymore, so we need to make
  ; any labels for variables and such *before* this point (or where we have another file open)
  .include "MovePayload.asm"
  
  ; and now, everything inside the payload!
  .include "payload/RNGGeneratorPayload.asm"
  .include "payload/CharacterSelectCommandsPayload.asm"
  
  
  ; I don't have an exact calculation of available space for the payload,
  ; but I do know that the most constraining factor is free RAM.
  ; We move the payload to somewhere that seems reserved for the stack,
  ; but the stack never reaches that far up. This is a liberal guess
  ; at how far up the stack goes and then some for a margin of error.
  ; Even with this conservative estimate how much space is free in RAM,
  ; 0x1FF000 - 0x1FCA00 = 0x2600 bytes for the payload *at least*.
  ; This should *easily* be more than enough, but just in case...
  .if org() > 0x801FF000
    .warning "WARNING: The payload has extended beyond 0x801FF000, there's a chance the payload will get clobbered by the stack!"
  .endif

.close



; game.bin
.openfile "../build env/Digimon Rumble Arena (USA)/vfs/bin/game.bin","../build env/Digimon Rumble Arena (USA)/inject/bin/game.bin",0x800643C0

  ; Disable 5 Round Limit (removes branch)
  .org 0x800712A8
    nop

.close



; title.bin
.openfile "../build env/Digimon Rumble Arena (USA)/vfs/bin/title.bin","../build env/Digimon Rumble Arena (USA)/inject/bin/title.bin",0x800643C0

  .include "title/EverythingUnlockedTitle.asm"
  .include "title/MiscQoLTitle.asm"
  .include "title/CharacterSelectCommandsTitle.asm"

.close
