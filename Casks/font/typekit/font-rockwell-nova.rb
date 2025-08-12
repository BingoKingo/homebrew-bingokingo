cask "font-rockwell-nova" do
  version "0.1,1485072"
  sha256 "665ea08638ceb5fffb2678c3fa196af18681078797955b07203536c5d5584b9d"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042396",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Rockwell Nova"
  homepage "https://fonts.adobe.com/fonts/rockwell-nova/"

  depends_on formula: "fonttools"

  font "RockwellNova.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/RockwellNova.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      \033[1m[L]\033[0m Private files cannot be downloaded without permission.
    EOS
  end
end
