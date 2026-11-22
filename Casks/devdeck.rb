# Homebrew Cask for DevDeck.
#
# This file is the SEED/source-of-truth for the separate tap repo `proshik/homebrew-tap`.
# Copy it there as `Casks/devdeck.rb`. The release workflow (.github/workflows/release.yml)
# then rewrites the `version` and `sha256` lines on every release.
cask "devdeck" do
  version "0.24.0"
  sha256 "3b6fc99f0d5902415211de0ce34fcf8c9a4bc56bbb512a8f83f0510e97ce5cdb"

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
