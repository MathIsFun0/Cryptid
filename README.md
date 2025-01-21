# Cryptid
An unbalanced Balatro mod.

Note: Cryptid requires [Steamodded **1.0.0-Alpha** (old calc)](https://github.com/Steamodded/smods/archive/refs/tags/old-calc.zip) and [Talisman](https://github.com/MathIsFun0/Talisman/releases/latest).

Cryptid currently adds:
![image](https://github.com/user-attachments/assets/0a03d6b2-d57f-4f92-9f42-a9ff201c5f2f)
![image](https://github.com/user-attachments/assets/c3f26d4d-2fb4-4b07-8f43-0d7a730e986d)


### [Official Discord](https://discord.gg/eUf9Ur6RyB)

### [Video Installation Guide](https://www.youtube.com/watch?v=aUr0gXE77rk)

### Frequently asked questions
* Credit to @jenwalter666 for creating this FAQ (forwarded from Cryptid Discord)

## General

> *My game is crashing on startup/something doesn't appear to be loading!*

Make sure everything is properly installed.
For Talisman, the folder that contains Talisman should be named `Talisman`. If you've downloaded the source code from GitHub (by clicking on [Code] and then [Download ZIP]), the folder within the ZIP may be called `Talisman-main`, which will cause a problem. Simply rename the folder(s) so that the `-main` part of the name is removed, so that the folder is just called `Talisman`.
Whenever you are manually updating Talisman or Cryptid, or any other mod for that matter, it's a good approach to instead delete the contents of the folder, then install the contents of the folder from the ZIP into the existing folder to avoid having to constantly rename the folder over and over.
For automatic updates, try using the [automatic update script](https://discord.com/channels/1264429948970733782/1268911536638787625).
It could also be that Steamodded is out of date, sometimes mods may use features of a new version that's absent in an older version, but don't change the version that they ask for.
You can grab the latest Steamodded by [clicking here](https://github.com/Steamopollys/Steamodded/archive/refs/heads/main.zip).

> *I can't see any new jokers/content!*

If you've installed everything correctly, but no new jokers, blinds, etc. are ingame, check the Mods list by clicking on [MODS] in the main menu, and look for Cryptid/Talisman.
If they show up red, that means there's a problem. Hover over the mod icon (which should be an exclamation mark) to see what said problem is. It could be an outdated dependency in most cases.

> *What's up with all the "M" jokers/references to Jolly Joker?*

"M" is a reference to an incident in the official Balatro Discord where a user named mjiojio was spamming the letter "m" in various channels. When asked what their least favourite joker was, they answered with Jolly Joker, and that's how the "M" joke became a thing!

> *There's some content in the mod I don't like! Is there any way to remove them?*

You can disable some features of the mod by opening your Settings, going over to the Spectral Pack tab, clicking [Cryptid], then checking/unchecking what you want.
You can also enable/disable certain music tracks. If you're a streamer, consider disabling the Jimball music for your safety!

> *I'm hitting infinity very often, is there any way to raise the limit of the scoring system?*

Talisman may be configured to be on **BigNum** mode, which has a maximum limit of ee308. You can make the limit virtually disappear by changing it to **OmegaNum**, which can handle e10##1000. You can configure it the same way; going into Settings, then the Spectral Pack tab, then Talisman. Be careful; if you have a saved run that was on a different number system, you won't be able to load it (unless if you switch back)!


> *I've experienced a crash/bug!*

Be sure to give us as much information about the bug/crash as possible. A way to reproduce the bug/crash is also especially useful information to help us fix it.
Remember; just saying you're crashing doesn't tell us anything. We need to know the details!

> *How can I disable a specific boss blind/joker/etc.?*

Let's use Blinds as an example.

In your Balatro mods folder, navigate to `\Cryptid\Items` and find `Blinds.lua`. (Different types of items will be contained in different Lua files in this folder.)

Towards the end of the file, there's an array named `items_togo`, near line 1230.  You can disable specific Blinds by deleting the relevant lines here.  These settings will take effect on a restart.
Most other files will have a similar items array near the bottom of the file that you can modify to remove specific things from Cryptid. This system will be changed to be in-game before Cryptid 0.6.0.
