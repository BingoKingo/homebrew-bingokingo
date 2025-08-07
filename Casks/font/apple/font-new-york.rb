cask "font-new-york" do
  version "16.0d2e2,17.0d5e1,6876036"
  sha256 "1c4baeef5a871bfb55fe0c7de1d3a8085934f855fd2f6eaf798e3c880b7f26fc"

  # url "https://devimages-cdn.apple.com/design/resources/download/NY.dmg"
  # sha256 "1c2eedb4526cc0f326f8b7ea978f5a433756476a2c8c56072537608edb88f8f4"
  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280250107",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "New York"
  name "NY"
  homepage "https://developer.apple.com/fonts/"

  font "NewYork.ttc"
  # No zap stanza required
end
