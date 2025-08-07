cask "font-sf-georgian" do
  version "19.0d4e1,20.0d1e1,367924"
  sha256 "3403fb099eefb26c5616f726b727ae006c38a1c41d200b7dce2e589f80e51125"

  # url "https://devimages-cdn.apple.com/design/resources/download/SF-Georgian.dmg"
  # sha256 "c16b1798472b26232445331ea51ac8299260674fe8fb7f3a354eedeb5390a2d2"
  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280249311",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "San Francisco Georgian"
  name "SF Georgian"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Georgian.ttc"
  # No zap stanza required
end
