cask "font-sf-compact" do
  version "21.0d5e1"

  on_macos do
    depends_on formula: "fonttools"
    depends_on formula: "p7zip"

    url "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg"
    sha256 "cfbd26b6cee815a313b78abba7a33b3f34b0e1ab8e11a89a24f22d62a5293740"

    preflight do
      system_command "/bin/bash", args: [
        "-c", <<~SHELL
          mkdir -p '#{staged_path}/tmp/' \
          && '#{HOMEBREW_PREFIX}/opt/p7zip/bin/7z' -txar e \
          '#{staged_path}/SF Compact Fonts.pkg' -y -o'#{staged_path}/tmp/' \
          && '#{HOMEBREW_PREFIX}/opt/p7zip/bin/7z' -tgzip e \
          '#{staged_path}/tmp/Payload' -y -o'#{staged_path}/tmp/' \
          && '#{HOMEBREW_PREFIX}/opt/p7zip/bin/7z' -tcpio e \
          '#{staged_path}/tmp/Payload~' './Library/Fonts/*' -o'#{staged_path}/Fonts' \
          && cp '#{staged_path}/tmp/License.rtf' '#{staged_path}/License.rtf' \
          && rm -r '#{staged_path}/tmp/' \
          && ls '#{staged_path}/Fonts/'* \
          | awk '{print "\\"" $0 "\\""}' \
          | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
          -o '#{staged_path}/SF-Compact.ttc'
        SHELL
      ]
    end
  end

  on_linux do
    sha256 "339ded8a52cec1dc2b0c18edd2c5a17489be4f24dcb1c03da3963557b854bf76"

    url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280249683",
        verified: "github.com/",
        header:   ["Accept: application/octet-stream",
                   "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                   "X-GitHub-Api-Version: 2022-11-28"]

    caveats do
      <<~EOS
        \033[1m[L]\033[0m Private files cannot be downloaded without permission.
      EOS
    end
  end

  name "San Francisco Compact"
  name "SF Compact"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Compact.ttc"
end
