cask "font-new-york" do
  version "16.0d2e2,17.0d5e1"

  on_macos do
    depends_on formula: "fonttools"
    depends_on formula: "p7zip"

    url "https://devimages-cdn.apple.com/design/resources/download/NY.dmg"
    sha256 "1c2eedb4526cc0f326f8b7ea978f5a433756476a2c8c56072537608edb88f8f4"

    preflight do
      system_command "/bin/bash", args: [
        "-c", <<~SHELL
          mkdir -p '#{staged_path}/tmp/' \
          && '#{HOMEBREW_PREFIX}/opt/p7zip/bin/7z' -txar e \
          '#{staged_path}/NY Fonts.pkg' -y -o'#{staged_path}/tmp/' \
          && '#{HOMEBREW_PREFIX}/opt/p7zip/bin/7z' -tgzip e \
          '#{staged_path}/tmp/Payload' -y -o'#{staged_path}/tmp/' \
          && '#{HOMEBREW_PREFIX}/opt/p7zip/bin/7z' -tcpio e \
          '#{staged_path}/tmp/Payload~' './Library/Fonts/*' -o'#{staged_path}/Fonts' \
          && cp '#{staged_path}/tmp/License.rtf' '#{staged_path}/License.rtf' \
          && rm -r '#{staged_path}/tmp/' \
          && ls '#{staged_path}/Fonts/'* \
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
        \033[1m[L]\033[0m Private files cannot be downloaded without permission.
      EOS
    end
  end

  name "New York"
  name "NY"
  homepage "https://developer.apple.com/fonts/"

  font "NewYork.ttc"
end
