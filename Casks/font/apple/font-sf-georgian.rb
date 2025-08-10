cask "font-sf-georgian" do
  version "19.0d4e1,20.0d1e1"

  on_macos do
    depends_on formula: "cpio"
    depends_on formula: "fonttools"
    depends_on formula: "gzip"

    url "https://devimages-cdn.apple.com/design/resources/download/SF-Georgian.dmg"
    sha256 "c16b1798472b26232445331ea51ac8299260674fe8fb7f3a354eedeb5390a2d2"

    preflight do
      system_command "/bin/bash", args: [
        "-c", <<~SHELL
          mkdir -p '#{staged_path}/tmp/' \
          && xar -xf '#{staged_path}/SF Georgian Fonts.pkg' -C '#{staged_path}/tmp/' \
          && cat '#{staged_path}/tmp/SFGeorgianFonts.pkg/Payload' \
          | '#{HOMEBREW_PREFIX}/opt/gzip/bin/gunzip' -dc \
          | '#{HOMEBREW_PREFIX}/opt/cpio/bin/cpio' -i -D '#{staged_path}/' \
          && rm -r '#{staged_path}/tmp/' \
          && ls '#{staged_path}/Library/Fonts/'* \
          | awk '{print "\\"" $0 "\\""}' \
          | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
          -o '#{staged_path}/SF-Georgian.ttc'
        SHELL
      ]
    end
  end

  on_linux do
    sha256 "3403fb099eefb26c5616f726b727ae006c38a1c41d200b7dce2e589f80e51125"

    url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280249311",
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

  name "San Francisco Georgian"
  name "SF Georgian"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Georgian.ttc"
end
