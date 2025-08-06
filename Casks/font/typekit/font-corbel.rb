cask "font-corbel" do
  version "0.1,1570756"
  sha256 "26ed5b10182f119dd05b11cbbfe6dbd0b31b432c23f09beba983dde55243f13e"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279916615",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Corbel"
  homepage "https://fonts.adobe.com/fonts/corbel/"

  font "Corbel.ttc"

  # No zap stanza required
end
