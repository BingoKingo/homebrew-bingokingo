cask "font-sf-hebrew" do
  version "19.2d1e1,20.0d1e1"

  on_macos do
    depends_on formula: "cpio"
    depends_on formula: "fonttools"
    depends_on formula: "gzip"

    url "https://devimages-cdn.apple.com/design/resources/download/SF-Hebrew.dmg"
    sha256 "3258e40715b8bcf45e9441dbbf7218aeeaa570065dcc1f7bfa55c9ed6d0b9384"

    preflight do
      system_command "/bin/bash", args: [
        "-c", <<~SHELL
          mkdir -p '#{staged_path}/tmp/' \
          && xar -xf '#{staged_path}/SF Hebrew Fonts.pkg' -C '#{staged_path}/tmp/' \
          && cat '#{staged_path}/tmp/SFHebrewFonts.pkg/Payload' \
          | '#{HOMEBREW_PREFIX}/opt/gzip/bin/gunzip' -dc \
          | '#{HOMEBREW_PREFIX}/opt/cpio/bin/cpio' -i -D '#{staged_path}/' \
          && rm -r '#{staged_path}/tmp/' \
          && ls '#{staged_path}/Library/Fonts/'* \
          | awk '{print "\\"" $0 "\\""}' \
          | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
          -o '#{staged_path}/SF-Hebrew.ttc'
        SHELL
      ]
    end
  end

  on_linux do
    sha256 "6f7a7b7e9e222212cde14b1f2aef0c8fdf285374e5a5ad7956b510f8d330a749"

    url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280249300",
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

  name "San Francisco Hebrew"
  name "SF Hebrew"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Hebrew.ttc"
end
