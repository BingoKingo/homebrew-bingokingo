cask "font-gill-sans-nova" do
  version "0.1,5146116"
  sha256 "6220546a045993058a25e4863da5ed5d90cf96f82eda3a66db6ec0220f55bc26"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279917051",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Gill Sans Nova"
  homepage "https://fonts.adobe.com/fonts/gill-sans-nova/"

  font "GillSansNova.ttc"

  # No zap stanza required
end
