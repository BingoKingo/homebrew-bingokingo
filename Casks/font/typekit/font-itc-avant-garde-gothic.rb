cask "font-itc-avant-garde-gothic" do
  version "0.1,1287084"
  sha256 "d68260ab59e3e5bf3463b85c2b9d25fbd40969035997220716b9cefcc6aca7de"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279916971",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "ITC Avant Garde Gothic"
  homepage "https://fonts.adobe.com/fonts/itc-avant-garde-gothic/"

  font "ItcAvantGardeGothic.ttc"

  # No zap stanza required
end
