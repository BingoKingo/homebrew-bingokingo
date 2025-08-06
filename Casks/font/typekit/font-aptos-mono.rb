cask "font-aptos-mono" do
  version "0.1,969220"
  sha256 "ab0ceb7fe9a172dcc706c1841fa5b753956694765f80f06bce208285f17782fe"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279916292",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Aptos Mono"
  homepage "https://fonts.adobe.com/fonts/aptos-mono/"

  font "AptosMono.ttc"

  # No zap stanza required
end
