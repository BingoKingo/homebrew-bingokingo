cask "font-rockwell" do
  version "0.1,263232"
  sha256 "11918436b37705153d8b24750eb039d883a343bc66f9678e9bd3fa730e0f49b3"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279916985",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Rockwell"
  homepage "https://fonts.adobe.com/fonts/rockwell/"

  font "RockwellStd.ttc"

  # No zap stanza required
end
