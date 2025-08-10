cask "font-dyspepsia@1.00" do
  version "1.00,29528"
  sha256 "0445b986237e9e20791857dd33d1d94b4e8100b2a86bd3653238a91e7083b5e7"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280924672",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Dyspepsia"
  homepage "https://www.dafont.com/dyspepsia.font"

  font "Dyspepsia_1.00.ttf"

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
