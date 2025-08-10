cask "font-aptos" do
  version "0.1,5227426"
  sha256 "f9c2bc66731be7d9fe8ce05e7c614cef001ec9eecfb7c95880dad0922a018807"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042458",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Aptos"
  homepage "https://fonts.adobe.com/fonts/aptos/"

  depends_on formula: "fonttools"

  font "Aptos.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/Aptos.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
