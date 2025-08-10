cask "font-sf-pro" do
  version "21.0d5e1"

  on_macos do
    depends_on formula: "cpio"
    depends_on formula: "fonttools"
    depends_on formula: "gzip"

    url "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg"
    sha256 "d3dd07c2d8082ed2bf286a0ecdcc33d6202da224a128056388d8540d0b4efa04"

    preflight do
      system_command "/bin/bash", args: [
        "-c", <<~SHELL
          mkdir -p '#{staged_path}/tmp/' \
          && xar -xf '#{staged_path}/SF Pro Fonts.pkg' -C '#{staged_path}/tmp/' \
          && cat '#{staged_path}/tmp/SFProFonts.pkg/Payload' \
          | '#{HOMEBREW_PREFIX}/opt/gzip/bin/gunzip' -dc \
          | '#{HOMEBREW_PREFIX}/opt/cpio/bin/cpio' -i -D '#{staged_path}/' \
          && rm -r '#{staged_path}/tmp/' \
          && ls '#{staged_path}/Library/Fonts/'* \
          | awk '{print "\\"" $0 "\\""}' \
          | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
          -o '#{staged_path}/SF-Pro.ttc'
        SHELL
      ]
    end
  end

  on_linux do
    sha256 "4d9153163b7de501dce3f6e811836a104dac2b0dfd6181036e256de86a34573b"

    url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280249338",
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

  name "San Francisco Pro"
  name "SF Pro"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Pro.ttc"
end
