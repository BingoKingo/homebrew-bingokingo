cask "font-sf-mono" do
  version "18.0d1e1,1200392"
  sha256 "062841cffc1d31adb5d5de9cd0b781c1712acbd1a6e45b21a5e60aeae7e09e01"

  # url "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg"
  # sha256 "6d4a0b78e3aacd06f913f642cead1c7db4af34ed48856d7171a2e0b55d9a7945"
    url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280249260",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "San Francisco Mono"
  name "SF Mono"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Mono.ttc"
  # No zap stanza required
end
