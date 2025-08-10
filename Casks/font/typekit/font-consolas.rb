cask "font-consolas" do
  version "0.1,2790322"
  sha256 "cf84fe35e09d9d001967da2e0d0a2978c3ba6f450a14be6a386baa75c20140d8"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042429",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Consolas"
  homepage "https://fonts.adobe.com/fonts/consolas/"

  depends_on formula: "fonttools"

  font "Consolas.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/Consolas.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
