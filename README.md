# Custom Leyak mod for Abiotic Factor

## Description

Custom Leyak mod for Abiotic Factor that modifies the Leyak's s respawn times and make it rather harmless to the player. The mod works in both single player, on listen servers and dedicated servers.

## Installation

The mod does not need to be installed on clients when using dedicated servers.

Installation instructions:

1. Download and install [UE4SS for Abiotic Factor](https://www.nexusmods.com/abioticfactor/mods/35)

2. Download the [Custom Leyak](https://github.com/dolphineye74/CustomLeyak/archive/refs/heads/main.zip) mod archive

3. Copy the entire `CustomLeyak` directory into your UE4SS `Mods` directory (e.g: `C:\Program Files (x86)\Steam\steamapps\common\AbioticFactor\AbioticFactor\Binaries\Win64\ue4ss\Mods\CustomLeyak`)

4. Add a new `CustomLeyak : 1` entry into the `mods.txt` file in the UE4SS `Mods` directory

```
SplitScreenMod : 0
CheatManagerEnablerMod : 1
ConsoleCommandsMod : 1
ConsoleEnablerMod : 1
BPML_GenericFunctions : 1
BPModLoaderMod : 0
CustomLeyak : 1

; Built-in keybinds, do not move up!
Keybinds : 1
```

5. Start the game

## Configuration

You may modify the `Config.lua` file to adjust the configuration to your liking:

* `LeyakHostile` indicates whether or not Leyak will be hostile to the player (default: `false`)

* `LeyakRespawnTime` allows to adjust the Leyak's respawn time in seconds (default: `3600 sec`)

* `LeyakGreyebRespawnTimeMultiplier` allows to adjust the Leyak's respawn time multiplier after Greyeb was consumed (default: `0.025` to respawn the Leyak every 90 seconds)
