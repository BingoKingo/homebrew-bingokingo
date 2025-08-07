cask "font-sf-pro" do
  version "21.0d5e1,359120"
  sha256 "4d9153163b7de501dce3f6e811836a104dac2b0dfd6181036e256de86a34573b"

  # url "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg"
  # sha256 "d3dd07c2d8082ed2bf286a0ecdcc33d6202da224a128056388d8540d0b4efa04"
    url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280249338",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "San Francisco Pro"
  name "SF Pro"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Pro.ttc"
  # No zap stanza required
end
