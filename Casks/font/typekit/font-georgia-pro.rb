cask "font-georgia-pro" do
  version "0.1,2889338"
  sha256 "68642e022d69a9571da792846a27faed63d51b014be15563d2b1f0f2247188d3"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042412",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Georgia Pro"
  homepage "https://fonts.adobe.com/fonts/georgia-pro/"

  depends_on formula: "fonttools"

  font "GeorgiaPro.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/GeorgiaPro.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
