cask "font-candara" do
  version "0.1,1169000"
  sha256 "a0b70bc521a16753216538025ab17ec72e1c4d7612a9680d976df6d6c937441c"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279916991",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Candara"
  homepage "https://fonts.adobe.com/fonts/candara/"

  font "Candara.ttc"

  # No zap stanza required
end
