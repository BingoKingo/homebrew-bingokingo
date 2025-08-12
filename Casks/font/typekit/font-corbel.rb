cask "font-corbel" do
  version "0.1,1585068"
  sha256 "7f5b5ab4c515cec96e49366423fa894c443d4f1d2a77b4dff147f99067f1d09c"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042416",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Corbel"
  homepage "https://fonts.adobe.com/fonts/corbel/"

  depends_on formula: "fonttools"

  font "Corbel.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/Corbel.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      \033[1m[L]\033[0m Private files cannot be downloaded without permission.
    EOS
  end
end
