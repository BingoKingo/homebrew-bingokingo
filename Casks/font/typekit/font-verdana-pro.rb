cask "font-verdana-pro" do
  version "0.1,2085146"
  sha256 "904084776bd0d01839cfaf3cccb4a646202aca2e3a62913dab2913f72363d202"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042292",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Verdana Pro"
  homepage "https://fonts.adobe.com/fonts/verdana-pro/"

  depends_on formula: "fonttools"

  font "VerdanaPro.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/VerdanaPro.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
