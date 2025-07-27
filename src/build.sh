# armips
armips DRAExpandedMusic.asm

# repack A.VFS
cd ../build\ env
quickbms -w -r digimon_vfs2.bms "Digimon Rumble Arena (USA)/A.VFS" "Digimon Rumble Arena (USA)/inject"

# psxbuild
psxbuild -c "Digimon Rumble Arena (USA).cat" DRAExpandedMusic.bin

# open output in emulator
mednafen DRAExpandedMusic.cue
