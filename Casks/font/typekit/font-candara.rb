cask "font-candara" do
  version "0.1,1183010"
  sha256 "aeddcb65e9897b22576723b0be920240ef3b4ca8f0331f71eb78a8f70951ed81"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042435",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Candara"
  homepage "https://fonts.adobe.com/fonts/candara/"

  depends_on formula: "fonttools"

  font "Candara.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/Candara.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
