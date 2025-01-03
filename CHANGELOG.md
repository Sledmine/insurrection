# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.8.0] - 2024-12-24
### Fixed
- Lobby map preview not being updated properly
- Lobby gametypes bitmaps not being updated instantly after changing it
- Issue that probably caused malformed credentials to be saved
- Labels with height greater that 1 will now be properly displayed in menus
- Crashes when pressing keys in the loading screen
- Issue with lists overriding other buttons behavior
- Nameplate preview not being restored when going back in the customization menu
- List elements not being properly erased when changing elements to a shorter list than what the list supports
### Added
- Scroll bar for custom list menus
- Custom menus now play open sound when opened as stock menus
- Icons for template selection in lobby menu
- Color primary and secondary menu customization for bipeds
- Visor customization option for bipeds (just available for The Flood project at the moment)
- Christmas special season event features (multiplayer trees will replaced by Christmas decorated trees, Christmas hats will be attached to all multiplayer bipeds during all December)
### Changed
- Scroll trough mouse sound error will not play when reaching edges of a list
- Lobby menu now displays map selection first instead of template
- Color customization is no longer taken from player profile
- Harmony is being deprecated in favor of Balltze
### Known issues
- Biped customization does not get reflected in game when player joins a lobby mid game
- Clicking too fast or clicking many times on some buttons may launch menus and actions twice and cause crashes or unexpected behavior
- 

## [2.7.0] - 2024-06-20
### Added
- New menu for Balltze mod configuration
- FOV slider in Chimera mod configuration menu, vertical and horizontal FOV are used based on the game aspect ratio
- Biped customization now takes color from current player profile
- Mouse scroll support for custom list menus
- New customization previews for upcoming "The Flood" project release

### Fixed
- Lobby menu options not moving horizontally
- Wrong assignation of properties in Chimera mod menu
- Biped customization not being applied instantly after changing it

### Changed
- Custom maps preview image generation, preview images from the lobby should now be displayed in Rich Presence too

## [2.6.4] - 2024-03-25
### Fixed
- Missing files for Insurrection services

### Added
- New dynamic light for custom biped selection

## [2.6.3] - 2024-03-15
### Fixed
- UI elements overflow when reaching the end of the list in some menus
- Safer string widget manipulation, preventing crashes when the string is too long
- Edge cases when using invalid combinations of biped customization after updating custom biped data

### Added
- Lobby keys are back, now you can copy the lobby key to the clipboard and share it with your friends

## [2.6.2] - 2024-02-26
### Fixed
- Customized biped UI data not being persisted properly
- Error in some scenarios where lobby does not exist anymore and some menus still want to access it
- Biped region customization not being saved after leaving the menu

## [2.6.1] - 2024-02-25
### Fixed
- Customize biped button dissapearing after getting back to the menu
- Public lobby toggle not being updated after rejoing a lobby
- Bugged menu when rejoing a lobby after leaving server due to a race condition

## [2.6.0] - 2024-02-05
### Added
- New menu for players joining a lobby that displays the lobby data such as map, game type, etc
- Work in progress armory customization menu

### Fixed
- Issue with Discord Rich Presence not getting reset properly after leaving a lobby
- Nameplate not being updated immediately after changing it
- Customization menu not loading proper background when a dialog is opened
- Stuck in a lobby when an error occurs while joining a server

## [2.5.1] - 2023-07-05
### Fixed
- Issue with Discord Rich Presence not working properly
- Wrong version of some lua modules not being loaded

## [2.5.0] - 2023-06-16
### Added
- New menu for client players lobby

### Fixed
- Discord Rich Presence warning appears just once per session

## [2.4.3] - 2023-04-29
### Fixed
- Missing label version on some menus
- Widget values not being updated after a DOM replacement

### Added
- Icons for game types in lobby menu

## [2.4.2] - 2023-04-28
### Fixed
- Font override for non shadow labels
- Discord Rich Presence should be loaded just in the insurrection login menu
- Campaign menu displaying multiple text labels

## [2.4.1] - 2023-04-03
### Added
- Font UI overriding by Lua using Chimera
- Attach Assault Rifle to custom selection biped

### Changed
- Dialog menu design
- Chimera configuration buttons do not show chimera config messages anymore

### Fixed
- Wrong menu header in pause menu screen

## [2.4.0] - 2023-02-06
### Added
- New color customization menu with in game preview
- Map preview for "treason" map

### Changed
- Insurrection now will only load a set of specific UI tags when running outside of the main menu

### Fixed
- Services now return a proper error message when there is an issue with a request
- Interface blur effect stuck when selecting a team in pause menu

## [2.3.0] - 2023-01-14
### Added
- Insurrection public profile name will be now used while in game
- Bipeds selection feature, select a custom biped to use in insurrection for some custom maps

### Changed
- Attempting joining/creating a lobby will reconnect you to a previous match if there is an on going game in another lobby

## [2.2.0] - 2022-12-27
### Added
- Preview images at selecting lobby map
- Option in pause menu while playing in an insurrection lobby to open default map pause menu

### Fixed
- Interface loading on external maps, stability improved in general
- Game crash related to Discord Rich Presence at reloading lua scripts

## [2.1.4] - 2022-12-10
### Fixed
- Menu aspect ratio not changing properly while Insurrection menu is loaded externally

## [2.1.3] - 2022-12-09
### Added
- Lobby summary text now changes based on selected definition option
- Expanded game network connection timeout limit at joining a server

### Fixed
- Rich presence behavior
- Interface not loading properly after failed server connection

## [2.1.2] - 2022-11-30
### Fixed
- Rich presence issue while playing in a lobby

## [2.1.1] - 2022-11-29
### Fixed
- Missing package file

## [2.1.0] - 2022-11-29
### Added
- Custom mods customization menu, including a menu to configure Chimera
- Requirement to enable Chimera feature to block server IPs while playing
- Discord Rich Presence integration to join and invite to lobbies
- Redesigned login, lobby and dashboard menus
- Over 27 new nameplates to choose

### Changed
- A new sky space and Halo ring model that are more aligned with the classic Halo CE style
- New menu background with better resolution and a few extra details (broken in some menus by now)

### Fixed
- Icons alignment for choose team buttons in pause menu
- Horizontal navigation for choose team buttons in pause menu
- Profile name change opening wrong menu

## [2.0.1] - 2022-11-18
### Fixed
- Missing package dependency

## [2.0.0] - 2022-11-18
### Added
- More than 100 new nameplates to use
- Support for Balltze integration
- In game pause menu for Insurrection lobbies

### Changed
- Multiplayer network games have a more Insurrection appearance
- Internal way to control UI dynamically
- UI script is now loaded globally to take more control over the game
- All nameplates will be available to use until further notice due to testing purposes
- UI script commands now will display a dialog message when needed

### Fixed
- UI loading after settings corruption when game closes unexpectedly
- Lobby elements filtering is now applied to the entire list instead of only available elements

## [1.1.0] - 2022-10-13
### Added
- Campaign Menu Support (partially)

### Fixed
- Long name maps selection in lobby

## [1.0.0] - 2022-09-17
### Fixed
- Issues with lobby navigation when creating a new one

### Added
- New experimental singpleplayer menu for upcoming campaign maps support
- Full chimera configuration parsing for later usage
- Command `insurrection_revert_fonts` to revert fonts previously setup

## [1.0.0-alpha.13] - 2022-09-02
### Fixed
- Wrong label version on menus

## [1.0.0-alpha.12] - 2022-09-02
### Added
- Dialog message when lobby map is not found in local maps, including maps downloaded via chimera

### Fixed
- Error message at borrowing game server as the host

## [1.0.0-alpha.11] - 2022-08-27
### Added
- Customization menu
- More nameplates
- Animated nameplates
- Allow nameplate selection

### Changed
- Core code modules like API models, requests, etc

### Fixed
- Rendering crashes on some menus

## [1.0.0-alpha.10] - 2022-08-06
### Fixed
- Turn off debug mode by default

## [1.0.0-alpha.9] - 2022-08-06
### Added
- External chimera loading and saving configuration
- Loading status orb text
- Support for loading and saving nameplate internally
- Command to setup insurrection fonts

### Changed
- Insurrection API definitions
- Minor details in dashboard and lobby layout

## [1.0.0-alpha.8] - 2022-07-13
### Added
- Input search bar for lobby elements
- Added label version to dashboard and lobby menus

### Fixed
- Scrolling custom menus due to an issue with scroll chunks/pagination
- Crash issue at starting lobby due to a pending async task resolution

## [1.0.0-alpha.7] - 2022-07-09
### Added
- Back button on lobby menu
- Keep login feature

### Changed
- Allow spaces on input widgets
- Create game on network menu
- Insurrection register message

### Fixed
- Lobby refresh not triggered after entering a lobby after creating one
- Issue with player profile creation when no profile

## [1.0.0-alpha.6] - 2022-07-11
### Changed
- Create game on network menu

## [1.0.0-alpha.5] - 2022-05-28
### Fixed
- Lobby update issue message at changing between menus
- Issue with input autofocus when opening menus

## [1.0.0-alpha.4] - 2022-05-21
### Changed
- Some design for buttons and menus

### Fixes
- Minor tweaks

## [1.0.0-alpha.3] - 2021-12-01
### Added
- Chimera history and bookmark servers screen

### Fixed
- List navigation on multiplayer menu options

## [1.0.0-alpha.2] - 2021-11-22
### Added
- Support for chimera high resolution fonts
- True widescreen main menu screen
- Multiplayer menu screen

## [1.0.0-alpha.1] - 2021-04-01
### Added
- Initial release
