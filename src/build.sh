NUMBER_SONGS=$(cat NumberSongs.txt)

# armips
armips -equ NUMBER_SONGS $NUMBER_SONGS DRAExpandedMusic.asm

# repack A.VFS
cd ../build\ env
quickbms -Q -w -r digimon_vfs2.bms "Digimon Rumble Arena (USA)/A.VFS" "Digimon Rumble Arena (USA)/inject"

# psxbuild
mkpsxiso -y -q -o DRAExpandedMusic.bin -c DRAExpandedMusic.cue "Digimon Rumble Arena (USA).xml"

# open output in emulator
mednafen DRAExpandedMusic.cue
