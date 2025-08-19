cask "font-aptos-mono" do
  version "0.1,997214"
  sha256 "16417789e13d489290bcd832853c2343ca27e795a17501975e37e91403075e67"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042505",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Aptos Mono"
  homepage "https://fonts.adobe.com/fonts/aptos-mono/"

  depends_on formula: "fonttools"

  font "AptosMono.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/AptosMono.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
