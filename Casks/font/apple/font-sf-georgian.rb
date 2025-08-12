cask "font-sf-georgian" do
  version "19.0d4e1,20.0d1e1"

  on_macos do
    depends_on formula: "fonttools"
    depends_on formula: "p7zip"

    url "https://devimages-cdn.apple.com/design/resources/download/SF-Georgian.dmg"
    sha256 "c16b1798472b26232445331ea51ac8299260674fe8fb7f3a354eedeb5390a2d2"

    preflight do
      system_command "/bin/bash", args: [
        "-c", <<~SHELL
          mkdir -p '#{staged_path}/tmp/' \
          && '#{HOMEBREW_PREFIX}/opt/p7zip/bin/7z' -txar e \
          '#{staged_path}/SF Georgian Fonts.pkg' -y -o'#{staged_path}/tmp/' \
          && '#{HOMEBREW_PREFIX}/opt/p7zip/bin/7z' -tgzip e \
          '#{staged_path}/tmp/Payload' -y -o'#{staged_path}/tmp/' \
          && '#{HOMEBREW_PREFIX}/opt/p7zip/bin/7z' -tcpio e \
          '#{staged_path}/tmp/Payload~' './Library/Fonts/*' -o'#{staged_path}/Fonts' \
          && cp '#{staged_path}/tmp/License.rtf' '#{staged_path}/License.rtf' \
          && rm -r '#{staged_path}/tmp/' \
          && ls '#{staged_path}/Fonts/'* \
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
        \033[1m[L]\033[0m Private files cannot be downloaded without permission.
      EOS
    end
  end

  name "San Francisco Georgian"
  name "SF Georgian"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Georgian.ttc"
end
