# homebrew-tap

Homebrew tap for [proshik](https://github.com/proshik)'s macOS tools.

```sh
brew tap proshik/tap
```

The install commands below add the tap automatically, so this step is optional.
Homebrew 6.0+ asks you to trust a third-party tap once: run `brew trust proshik/tap` if you see "untrusted tap".

## Packages

| Package | Type | Description | Install | Project |
| --- | --- | --- | --- | --- |
| [revust](Formula/revust.rb) | formula | Standalone supervised review CLI with a terminal interface (macOS, Apple Silicon) | `brew install proshik/tap/revust` | [proshik/revust](https://github.com/proshik/revust) |
| [devdeck](Casks/devdeck.rb) | cask | Menu bar app to launch, stop and monitor local dev commands and daemons (macOS 15+) | `brew install --cask proshik/tap/devdeck` | [proshik/devdeck](https://github.com/proshik/devdeck) |

## Updating

```sh
brew update && brew upgrade proshik/tap/revust
```

DevDeck updates itself in-app via Sparkle (the cask is `auto_updates`), so `brew upgrade` is not needed for it.

## How packages are updated

- **devdeck**: the [release workflow](https://github.com/proshik/devdeck/blob/main/.github/workflows/release.yml) of the project rewrites `version` and `sha256` in `Casks/devdeck.rb` on every release. Do not edit those lines by hand.
- **revust**: `Formula/revust.rb` is updated by hand after a release, so it may lag behind the [latest release](https://github.com/proshik/revust/releases/latest).

## License

[MIT](LICENSE)
