cask "font-verdana-pro" do
  version "0.1,1988284"
  sha256 "8060d8b6f2c20eec24747e02aeeb6d4b1282d7ebf67be3d14e998690a94094a8"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279917042",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Verdana Pro"
  homepage "https://fonts.adobe.com/fonts/verdana-pro/"

  font "VerdanaPro.ttc"

  # No zap stanza required
end
