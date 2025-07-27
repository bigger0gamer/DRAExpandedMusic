# DRA Expanded Music

;This is basically just [True OG Edition](https://github.com/bigger0gamer/TrueOGEdition) but with almost everything cut out, giving you a vanilla classic gameplay experience but with one big change:

- This version has *both* the Japanese and International soundtracks, in a single ROM!
  - No matter the mode, all music will be picked mostly randomly, with the exception of never hearing the theme for one stage on another.
- And a small selection of Quality of Life features from True OG Edtion
  - Everything Unlocked, no save file required!
  - Allow Mirror Matches (Without Holding Select)
  - Bottom Row Evos In Arcade Mode
  - Remove 5 Round Limit

## How To Play

Apply the .xdelta patch in the releases tab to a clean ROM of DRA.

## Building (Only 4 Hackers!)

If you only want to play the ROM hack, check the How To Play section. If you'd like to customize the music selection, here's how to build the hack for yourself.

### Dependencies

You will need to install the following:

- [armips](https://github.com/Kingcom/armips) v0.11 or newer
- [psximager](https://github.com/cebix/psximager) v2.2 or newer
- [quickbms](https://aluigi.altervista.org/quickbms.htm) v0.11.0 or newer
- [XAPacker](https://github.com/N4gtan/XAPacker) v1.2 or newer
- A way to convert mp3/wav/flac music files into single .xa audio files
- A text editor

This project assumes you are using a flavor of Linux, and only provides bash scripts. Windows and MacOS will suffice, but you will have to make your own build script modeled after the included one.

### Setup the build environment

You will need to provide a clean copy of Digimon Rumble Arena & Digimon Tamers Battle Evolution. Place it in the `/build env` dir, and run `/build env/extract.sh`, and everything should be setup for you.

### Customizing Songs

Convert any custom songs you want to add to .xa, and place them in the `/build env/Digimon Rumble Arena (USA)/A` directory, then modify `A.csv` to add a new line for each song. You can copy and paste another entry, then modify the file name according. The important part is to edit the last number at the end! The original game uses "slots" 0-120. The JP OST consumes slots 121-126. If you keep the JP OST, then you should start adding tracks at 127, otherwise you can remove the JP OST and start adding at 121.

The part that will catch you off guard: Find the file `/src/payload/RNGGeneratorPayload.asm` and find lines 9 and 12. They look like this

```
slti v0,ra,16+6
addi ra,ra,-10-6
```

The "6" at the end of each is for the 6 JP OST songs. If you removed the JP OST songs, delete the "+6" and "-6", otherwise leave them. Then, add "+X" and "-X" onto each line, where X is the number of extra songs you added (Eg: 4 songs is "+4" and "-4", and save the file.

Finally, run the command `XAPacker A/A.csv` in the `/build env/Digimon Rumble Arena (USA)` directory, and rename the `A_NEW.XAP` output to `A.XAP` overwriting the old `A.XAP`.

### Building

This should be as simple as running `/src/build.sh`, but the basic overview is thus:

```
armips TrueOG.asm
cd ../build\ env
quickbms -w -r digimon_vfs2.bms "Digimon Rumble Arena (USA)/A.VFS" "Digimon Rumble Arena (USA)/inject"
psxbuild -c "Digimon Rumble Arena (USA).cat" DRAExpandedMusic.bin
```

This will assemble the hack, insert any necessary files into the game's compressed file system, and build a new disc image based on the resulting output. Automatically opening it in an emulator to test out new changes will be convienent.

## Credits

Nagtan - For making *exactly* the tool I needed, literally a month before I knew I needed it! You're the fucking goat!

DarkChaosBlast - For making the QuickBMS script that made extracting and injecting A.VFS's files possible. I'm not sure I'd have ever been able to bust this file open myself!

The developer of mednafen - for making my favorite emulator by miles, especially for PS1. Thank you, anonymous coward.

Kingcom - for making armips. Holy *fuck* is this such a great and powerful tool for PS1 ROM hacking. It is far and away better than what I was doing for old versions of True OG Edition, and I never could have made such a good tool on my own. Thank you.
