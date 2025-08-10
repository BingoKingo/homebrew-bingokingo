cask "font-arial-nova" do
  version "0.1,1350296"
  sha256 "48d7e5a8f678de436487fe9a2be8568097feab532b9f1b41acf0f9ed281c12ab"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042450",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Arial Nova"
  homepage "https://fonts.adobe.com/fonts/arial-nova/"

  depends_on formula: "fonttools"

  font "ArialNova.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/ArialNova.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
