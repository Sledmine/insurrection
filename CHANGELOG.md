# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
