cask "font-arial-nova" do
  version "0.1,1314340"
  sha256 "9255f3e9084c55223880ecb72a1150f164a65c0c986d9197d4003bb20f887ed4"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279940200",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Arial Nova"
  homepage "https://fonts.adobe.com/fonts/arial-nova/"

  font "ArialNova.ttc"

  # No zap stanza required
end
