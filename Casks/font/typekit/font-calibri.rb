cask "font-calibri" do
  version "0.1,9952736"
  sha256 "50be36402fd916c426bf1b0403a9c98da9decd11062f4b7fb673c2cfb6ecbd9e"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279915398",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Calibri"
  homepage "https://fonts.adobe.com/fonts/calibri/"

  font "Calibri.ttc"

  # No zap stanza required
end
