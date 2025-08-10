cask "font-sf-compact" do
  version "21.0d5e1"

  on_macos do
    depends_on formula: "cpio"
    depends_on formula: "fonttools"
    depends_on formula: "gzip"

    url "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg"
    sha256 "cfbd26b6cee815a313b78abba7a33b3f34b0e1ab8e11a89a24f22d62a5293740"

    preflight do
      system_command "/bin/bash", args: [
        "-c", <<~SHELL
          mkdir -p '#{staged_path}/tmp/' \
          && xar -xf '#{staged_path}/SF Compact Fonts.pkg' -C '#{staged_path}/tmp/' \
          && cat '#{staged_path}/tmp/SFCompactFonts.pkg/Payload' \
          | '#{HOMEBREW_PREFIX}/opt/gzip/bin/gunzip' -dc \
          | '#{HOMEBREW_PREFIX}/opt/cpio/bin/cpio' -i -D '#{staged_path}/' \
          && rm -r '#{staged_path}/tmp/' \
          && ls '#{staged_path}/Library/Fonts/'* \
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
        [L] Private files cannot be downloaded without permission.
      EOS
    end
  end

  name "San Francisco Compact"
  name "SF Compact"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Compact.ttc"
end
