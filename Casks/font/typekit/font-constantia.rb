cask "font-constantia" do
  version "0.1,1369960"
  sha256 "a6c19e5207d1fd54d69d977c4ad2ee43fe4c3c71fc9be1f47d26bfbce9f8c638"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279916493",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Constantia"
  homepage "https://fonts.adobe.com/fonts/constantia/"

  font "Constantia.ttc"

  # No zap stanza required
end
