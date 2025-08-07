cask "font-sf-hebrew" do
  version "19.2d1e1,20.0d1e1,326620"
  sha256 "6f7a7b7e9e222212cde14b1f2aef0c8fdf285374e5a5ad7956b510f8d330a749"

  # url "https://devimages-cdn.apple.com/design/resources/download/SF-Hebrew.dmg"
  # sha256 "3258e40715b8bcf45e9441dbbf7218aeeaa570065dcc1f7bfa55c9ed6d0b9384"
  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280249300",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "San Francisco Hebrew"
  name "SF Hebrew"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Hebrew.ttc"
  # No zap stanza required
end
