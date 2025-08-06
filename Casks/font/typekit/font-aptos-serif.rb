cask "font-aptos-serif" do
  version "0.1,1610868"
  sha256 "5bd7135d6ffc6f0fc3fea57327ed8ada184f17ec83f51f1fdf1250fb7cfff815"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279914922",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Aptos Serif"
  homepage "https://fonts.adobe.com/fonts/aptos-serif/"

  font "AptosSerif.ttc"

  # No zap stanza required
end
