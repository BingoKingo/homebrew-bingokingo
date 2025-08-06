cask "font-georgia-pro" do
  version "0.1,2792964"
  sha256 "7383352776f8584461566231296acea81c5a09a992e56ea170184ead2dacbd44"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279917031",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Georgia Pro"
  homepage "https://fonts.adobe.com/fonts/georgia-pro/"

  font "GeorgiaPro.ttc"

  # No zap stanza required
end
