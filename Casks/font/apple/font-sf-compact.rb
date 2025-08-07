cask "font-sf-compact" do
  version "21.0d5e1,249151112"
  sha256 "339ded8a52cec1dc2b0c18edd2c5a17489be4f24dcb1c03da3963557b854bf76"

  # url "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg"
  # sha256 "cfbd26b6cee815a313b78abba7a33b3f34b0e1ab8e11a89a24f22d62a5293740"
  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280249683",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "San Francisco Compact"
  name "SF Compact"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Compact.ttc"
  # No zap stanza required
end
