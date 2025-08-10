cask "font-sf-arabic" do
  version "20.0d1e1,20.0d1e2"

  on_macos do
    depends_on formula: "cpio"
    depends_on formula: "fonttools"
    depends_on formula: "gzip"

    url "https://devimages-cdn.apple.com/design/resources/download/SF-Arabic.dmg"
    sha256 "2760c62d502b77012c49517c2ea392ec2d4c647fe060985c927df48d105197b9"

    preflight do
      system_command "/bin/bash", args: [
        "-c", <<~SHELL
          mkdir -p '#{staged_path}/tmp/' \
          && xar -xf '#{staged_path}/SF Arabic Fonts.pkg' -C '#{staged_path}/tmp/' \
          && cat '#{staged_path}/tmp/SFArabicFonts.pkg/Payload' \
          | '#{HOMEBREW_PREFIX}/opt/gzip/bin/gunzip' -dc \
          | '#{HOMEBREW_PREFIX}/opt/cpio/bin/cpio' -i -D '#{staged_path}/' \
          && rm -r '#{staged_path}/tmp/' \
          && ls '#{staged_path}/Library/Fonts/'* \
          | awk '{print "\\"" $0 "\\""}' \
          | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
          -o '#{staged_path}/SF-Arabic.ttc'
        SHELL
      ]
    end
  end

  on_linux do
    sha256 "643e04537a5db4e2b350de8619aa34462af99549da0d5a4725e44febc7172833"

    url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280250053",
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

  name "San Francisco Arabic"
  name "SF Arabic"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Arabic.ttc"
end
