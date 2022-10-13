# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
