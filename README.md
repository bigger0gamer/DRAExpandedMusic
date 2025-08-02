# DRA Expanded Music

This is basically just [True OG Edition](https://github.com/bigger0gamer/TrueOGEdition) but with almost everything cut out, giving you a vanilla classic gameplay experience but with one big change:

- This version has *both* the Japanese and International soundtracks, in a single ROM!
  - No matter the mode, all music will be picked mostly randomly, with the exception of never hearing the theme for one stage on another.
- And a small selection of Quality of Life features from True OG Edtion
  - Everything Unlocked, no save file required!
  - Allow Mirror Matches (Without Holding Select)
  - Bottom Row Evos In Arcade Mode
  - Remove 5 Round Limit

## How To Play

In the [releases tab](), you can find a couple premade patches. If you want to build a version with your own custom music, check below.

## Building (Add Custom Music)

If you'd like to customize the music selection, here's how to build the hack for yourself.

### Dependencies

You will need to install the following:

- Build ASM & bin/cue
  - [armips](https://github.com/Kingcom/armips) v0.11 or newer
  - [quickbms](https://aluigi.altervista.org/quickbms.htm) v0.12.0 or newer
  - [mkpsxiso](https://github.com/Lameguy64/mkpsxiso) v2.10 or newer
- Add custom music
  - [XAPacker](https://github.com/N4gtan/XAPacker/actions/runs/16606526632#artifacts) commit 49be93f
  - [psxavenc](https://github.com/WonderfulToolchain/psxavenc/releases/tag/v0.2.1) v0.2.1 (newer versions should work, but you will have to modify packxap.sh accordingly. 0.3.0 kept seg faulting on me.)

This project assumes you are using a flavor of Linux, and only provides bash scripts. Windows and MacOS will suffice, but you will have to make your own build scripts modeled after the included one.

### Setup the build environment

You will need to provide a clean copy of Digimon Rumble Arena & Digimon Tamers Battle Evolution. Place it in the `/build env` dir, and run `extract.sh`, and everything should be setup for you.

### Customizing Songs

In the `src/songs` directory, drop in the files for any music you want to add. Common file types like mp3, wav, and flac are supported. Anything ffmpeg supports should work.

### Building

Next, simply run `packxap.sh` to rebuild A.XAP with your new music, then run `build.sh` to rebuild the hack with your new music.

## Credits

Nagtan - For making *exactly* the tool I needed, literally a month before I knew I needed it! You're the fucking goat!

DarkChaosBlast - For making the QuickBMS script that made extracting and injecting A.VFS's files possible. I'm not sure I'd have ever been able to bust this file open myself!

The developer of mednafen - for making my favorite emulator by miles, especially for PS1. Thank you, anonymous coward.

Kingcom - for making armips. Holy *fuck* is this such a great and powerful tool for PS1 ROM hacking. It is far and away better than what I was doing for old versions of True OG Edition, and I never could have made such a good tool on my own. Thank you.
