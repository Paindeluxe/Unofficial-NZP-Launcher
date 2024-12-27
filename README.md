# Unofficial-NZP-Launcher
### This is a unofficial Launcher for the Free and Open Source Game called [NZP](https://github.com/nzp-team/nzportable).

> _Thank you for using my Unofficial NZP Launcher. I hope you will enjoy using this as much as I enjoyed making it!_

## Changelog:
### Current Version: 1.2.0

From Version 1.0.0 to -> Version 1.1.0

- Added CPU Architecture Detection to avoid Downloading an Unsupported Version of NZP. (Lacking ARM Support.)

From Version 1.1.0 to -> Version 1.2.0

- Finished CPU Architecture Detection to also support ARM Devices.
- Minor Code Cleanup to help Readability.

## Supported Platforms/Architectures:
__This Launcher currently only Supports Linux__. But Windows, and maybe even MacOS Support is planned to be added in the Future!
I promise that I won't make the MacOS Version just a Web App.

## Notes:

- It's a Bash Script which you run in the Terminal.
- The "modifications" Folder is used to keep certain Items between Updates.
- Please use the "modifications" Folder over "nzp" for installing Mods/Custom Maps as the current Process will overwrite everything in NZP in every Update. (That might be bad for SSDs but who knows...)

## Features:
1. It has Mod Support
2. It Automatically Updates the Game, every Day (Can be changed once I add Settings.)
3. It installs the correct NZP Version based off of the CPU Architecture

## Current Flaws:
1. This Launcher Version doesn't adapt to changes in the Folder Structure.
2. It felt a bit Archaic writing a few Lines of this Script (Like a unused Section about deleting the entire "nzp" Folder to avoid possible changes in the Folder Structure.
3. The User could accidentally lose a Folder called "temp" if they had one in the Directory containing this Script.
4. The NZP Game Files are not isolated from the Launcher's Directory, making it look a bit Messy.
5. While this Auto-Update NZP, it does not Self-Update itself yet! This is pretty stupid, though some see it as a Security Risk.
6. This Launcher is lacking a way to easily change Settings, while also being User Friendly. 
