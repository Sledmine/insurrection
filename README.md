# Insurrection
Insurrection is a UI project for Halo Custom Edition that aims to bring support for a full
widescreen menu with different features for the Halo Custom Edition game, such as bookmarking
servers in game, handling different game configurations, bringing important news to players and more.

# Getting Insurrection
Get the latest version available using [Mercury](https://github.com/Sledmine/Mercury)
with the following line on the terminal:
```
mercury install insurrection
```
**NOTE:** This project has [Harmony](https://github.com/JerryBrick/harmony) as a dependency, it is
used to force a different aspect ratio for the UI, setting it to 16:9.

It also uses [Chimera](https://github.com/SnowyMouse/chimera) as it is a loader for other 
binary mods as [Harmony](https://github.com/JerryBrick/harmony), lua scripting is another function
being used from this.

# Screenshots

We are aiming for high resolution assets as possible, this includes fonts now thanks to Chimera we
can override fonts with higher resolution ones, by now Chimera only provides one way to override
fonts globally and not per map or per font, that would be a feature to request.
Simply replace the font_override ini block on your config with one from this repository.

A high resolution mouse bitmap was added, more ui widget components were moved to support a real
widescreen layout.

![main_menu](images/1.0.0-alpha.4/main_menu.png)