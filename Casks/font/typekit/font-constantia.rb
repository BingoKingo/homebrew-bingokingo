cask "font-constantia" do
  version "0.1,1382666"
  sha256 "b1255509845a266cf53abe19e8e8810c3ab431603fbf1b03f9824b36cf211c7e"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042426",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Constantia"
  homepage "https://fonts.adobe.com/fonts/constantia/"

  depends_on formula: "fonttools"

  font "Constantia.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/Constantia.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      \033[1m[L]\033[0m Private files cannot be downloaded without permission.
    EOS
  end
end
