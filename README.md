# Changelog Script by Three Amigos

![tam_changelog](https://raw.githubusercontent.com/ThreeAmigosModding/ThreeAmigosModding/main/img/tam_changelog.png)

[Support Discord](https://discord.gg/threeamigos)

[Tebex](https://threeamigos.shop)

## Installation

Download the release of [ox_lib](https://github.com/overextended/ox_lib) from  & add it to your server or resources.cfg **BEFORE** `TAM_changelog`

Add `ensure TAM_changelog` to your server or resources cfg file

## Configuration

Edit the `changelog.md` file included with this resource. It uses [markdown format](https://www.markdownguide.org/cheat-sheet/)

## Development

The export `showChangelog` accepts a boolean and defines if the changelog should be shown or not.

You can show the changelog via triggering the client event `tam:showChangelog`.
