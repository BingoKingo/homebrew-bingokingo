cask "font-rockwell" do
  version "0.1,276208"
  sha256 "230921596f8d5beff62ac0fcc73660e4eebfa281bdcd77e7f57f777b2c5e2c18"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042392",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Rockwell"
  homepage "https://fonts.adobe.com/fonts/rockwell/"

  depends_on formula: "fonttools"

  font "RockwellStd.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/RockwellStd.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
