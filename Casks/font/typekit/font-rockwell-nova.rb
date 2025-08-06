cask "font-rockwell-nova" do
  version "0.1,1433308"
  sha256 "e45f6aa7f6bcde223e37895c65093c611648c0645be5b4a8d74c91d5bff87edb"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279914936",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Rockwell Nova"
  homepage "https://fonts.adobe.com/fonts/rockwell-nova/"

  font "RockwellNova.ttc"

  # No zap stanza required
end
