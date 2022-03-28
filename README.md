<html>
    <p align="center">
        <img width="400px" src="images/design/logos/insurrection_logo_2.png"/>
    </p>
</html>

---

Insurrection is a project for Halo Custom Edition that aims to bring a modern UI
with support for a full widescreen menu, a variety of in game customizations for other mods, some
features such as bookmarking reconnect from the menu, editing extra game configurations, message of
the day with important news to players and the most important, provides a new multiplayer experience
as service to play with friends in any map anytime whenever you want for free.

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

![intro_menu](images/screenshots/intro_menu.png)
![main_menu](images/screenshots/main_menu.png)
![multiplayer_menu](images/screenshots/multiplayer_menu.png)
![legacy_servers_menu](images/screenshots/legacy_servers_menu.png)