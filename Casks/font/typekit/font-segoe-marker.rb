cask "font-segoe-marker" do
  version "0.1,297534"
  sha256 "9946ab8ea746873d5a11a113315845099702288ced468ce5630cb4f6c76f826b"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042389",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Segoe Marker"
  homepage "https://fonts.adobe.com/fonts/segoe-marker/"

  font "Segoe Marker Regular.ttf"

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
