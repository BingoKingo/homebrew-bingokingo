cask "font-aptos" do
  version "0.1,5073684"
  sha256 "2249be2e3ce548ddeecd9f3aaa2f1578e7033c205578a1f45645e65466e9e05a"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279914842",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Aptos"
  homepage "https://fonts.adobe.com/fonts/aptos/"

  font "Aptos.ttc"

  # No zap stanza required
end
