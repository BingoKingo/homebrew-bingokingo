cask "font-gill-sans-nova" do
  version "0.1,5377134"
  sha256 "147078ba1b71d13d83ae42db5000f5b635551af37398421a2e9ca24693d6233e"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042405",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Gill Sans Nova"
  homepage "https://fonts.adobe.com/fonts/gill-sans-nova/"

  depends_on formula: "fonttools"

  font "GillSansNova.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/GillSansNova.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      \033[1m[L]\033[0m Private files cannot be downloaded without permission.
    EOS
  end
end
