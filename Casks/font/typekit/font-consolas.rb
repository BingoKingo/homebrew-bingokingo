cask "font-consolas" do
  version "0.1,2789768"
  sha256 "1a0de0da70164a539d1071b24c3564797414cd3672470e5d32227839a5a6ccc8"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279916568",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Consolas"
  homepage "https://fonts.adobe.com/fonts/consolas/"

  font "Consolas.ttc"

  # No zap stanza required
end
