cask "font-calibri" do
  version "0.1,8332034"
  sha256 "45de951e140e1c26e1e14f65a3734463f6d1a48d28dd5f131772133c24f81bf4"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042440",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Calibri"
  homepage "https://fonts.adobe.com/fonts/calibri/"

  depends_on formula: "fonttools"

  font "Calibri.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/Calibri.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
