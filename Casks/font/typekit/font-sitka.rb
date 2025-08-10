cask "font-sitka" do
  version "0.1,12254978"
  sha256 "8e119d7df2258863e2c2c34dd146c9b71099cd982d1aabc8d5cfdb2cdfaf924d"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042329",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Sitka"
  homepage "https://fonts.adobe.com/fonts/sitka/"

  depends_on formula: "fonttools"

  font "Sitka.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/Sitka.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
