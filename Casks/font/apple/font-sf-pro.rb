cask "font-sf-pro" do
  version "21.0d5e1"

  on_macos do
    depends_on formula: "fonttools"
    depends_on formula: "p7zip"

    url "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg"
    sha256 "d3dd07c2d8082ed2bf286a0ecdcc33d6202da224a128056388d8540d0b4efa04"

    preflight do
      system_command "/bin/bash", args: [
        "-c", <<~SHELL
          mkdir -p '#{staged_path}/tmp/' \
          && '#{HOMEBREW_PREFIX}/opt/p7zip/bin/7z' -txar e \
          '#{staged_path}/SF Pro Fonts.pkg' -y -o'#{staged_path}/tmp/' \
          && '#{HOMEBREW_PREFIX}/opt/p7zip/bin/7z' -tgzip e \
          '#{staged_path}/tmp/Payload' -y -o'#{staged_path}/tmp/' \
          && '#{HOMEBREW_PREFIX}/opt/p7zip/bin/7z' -tcpio e \
          '#{staged_path}/tmp/Payload~' './Library/Fonts/*' -o'#{staged_path}/Fonts' \
          && cp '#{staged_path}/tmp/License.rtf' '#{staged_path}/License.rtf' \
          && rm -r '#{staged_path}/tmp/' \
          && ls '#{staged_path}/Fonts/'* \
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
        \033[1m[L]\033[0m Private files cannot be downloaded without permission.
      EOS
    end
  end

  name "San Francisco Pro"
  name "SF Pro"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Pro.ttc"
end
