cask "font-new-york" do
  version "16.0d2e2,17.0d5e1"

  on_macos do
    depends_on formula: "cpio"
    depends_on formula: "fonttools"
    depends_on formula: "gzip"

    url "https://devimages-cdn.apple.com/design/resources/download/NY.dmg"
    sha256 "1c2eedb4526cc0f326f8b7ea978f5a433756476a2c8c56072537608edb88f8f4"

    preflight do
      system_command "/bin/bash", args: [
        "-c", <<~SHELL
          mkdir -p '#{staged_path}/tmp/' \
          && xar -xf '#{staged_path}/NY Fonts.pkg' -C '#{staged_path}/tmp/' \
          && cat '#{staged_path}/tmp/NYFonts.pkg/Payload' \
          | '#{HOMEBREW_PREFIX}/opt/gzip/bin/gunzip' -dc \
          | '#{HOMEBREW_PREFIX}/opt/cpio/bin/cpio' -i -D '#{staged_path}/' \
          && rm -r '#{staged_path}/tmp/' \
          && ls '#{staged_path}/Library/Fonts/'* \
          | awk '{print "\\"" $0 "\\""}' \
          | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
          -o '#{staged_path}/NewYork.ttc'
        SHELL
      ]
    end
  end

  on_linux do
    sha256 "1c4baeef5a871bfb55fe0c7de1d3a8085934f855fd2f6eaf798e3c880b7f26fc"

    url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280250107",
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

  name "New York"
  name "NY"
  homepage "https://developer.apple.com/fonts/"

  font "NewYork.ttc"
end
