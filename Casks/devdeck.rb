# Homebrew Cask for DevDeck.
#
# This file is the SEED/source-of-truth for the separate tap repo `proshik/homebrew-tap`.
# Copy it there as `Casks/devdeck.rb`. The release workflow (.github/workflows/release.yml)
# then rewrites the `version` and `sha256` lines on every release.
cask "devdeck" do
  version "0.13.0"
  sha256 "d68e8fd06b4e5c3ac96abd02297e3beb8d51e500d31ed2a5d7a79b8f0f62fc0c"

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
