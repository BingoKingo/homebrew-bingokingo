cask "font-itc-avant-garde-gothic" do
  version "0.1,1356370"
  sha256 "a963b68bc8d99ed567c0f0edb03e9212cc8bbb129e352b742bc36903744748e2"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042399",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "ITC Avant Garde Gothic"
  homepage "https://fonts.adobe.com/fonts/itc-avant-garde-gothic/"

  depends_on formula: "fonttools"

  font "ItcAvantGardeGothic.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/ItcAvantGardeGothic.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      \033[1m[L]\033[0m Private files cannot be downloaded without permission.
    EOS
  end
end
