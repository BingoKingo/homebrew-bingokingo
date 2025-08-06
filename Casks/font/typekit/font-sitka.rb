cask "font-sitka" do
  version "0.1,5997384"
  sha256 "b893f7d72c158219e7029fdd7921fc42059e67efacd673aebed008061612b06f"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279915641",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Sitka"
  homepage "https://fonts.adobe.com/fonts/sitka/"

  font "Sitka.ttc"

  # No zap stanza required
end
