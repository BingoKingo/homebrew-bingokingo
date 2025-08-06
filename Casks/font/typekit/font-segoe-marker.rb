cask "font-segoe-marker" do
  version "0.1,297388"
  sha256 "7ffaeabcf4190933dea7826714350018da9fedcca229f602170967bb7ec94875"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/279917022",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Segoe Marker"
  homepage "https://fonts.adobe.com/fonts/segoe-marker/"

  font "SegoeMarkerRegular.ttf"

  # No zap stanza required
end
