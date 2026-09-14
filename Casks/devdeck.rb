# Homebrew Cask for DevDeck.
#
# This file is the SEED/source-of-truth for the separate tap repo `proshik/homebrew-tap`.
# Copy it there as `Casks/devdeck.rb`. The release workflow (.github/workflows/release.yml)
# then rewrites the `version` and `sha256` lines on every release.
cask "devdeck" do
  version "0.18.4"
  sha256 "638dc3c1eb1bd8008f9cccdaf5f1ad9c3d41f80323729c8097f1d15cdd1dc571"

  url "https://github.com/proshik/devdeck/releases/download/v#{version}/DevDeck-#{version}.dmg"
  name "DevDeck"
  desc "Menu-bar control deck for local dev commands and daemons"
  homepage "https://github.com/proshik/devdeck"

  auto_updates true                 # self-updates in-app via Sparkle; brew won't fight it
  depends_on macos: :sequoia   # macOS 15+

  app "DevDeck.app"

  caveats <<~EOS
    DevDeck is not notarized (free distribution). On first launch Gatekeeper may block it
    because Homebrew quarantines downloads. Remove the quarantine flag once:

      xattr -dr com.apple.quarantine "#{appdir}/DevDeck.app"

    or right-click the app and choose "Open". Subsequent updates are delivered in-app
    via Sparkle and are not quarantined.
  EOS
end
