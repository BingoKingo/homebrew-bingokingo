cask "font-shobhika" do
  version "1.05"
  sha256 "5590e88e3f35b654abcf28f106cf7cd9cfc8379004dbaac4d0f39879c6a9f438"

  url "https://github.com/Sandhi-IITBombay/Shobhika/releases/download/v#{version}/Shobhika-#{version}.zip"
  name "Shobhika"
  homepage "https://github.com/Sandhi-IITBombay/Shobhika/"

  depends_on formula: "fonttools"

  font "Shobhika.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/Shobhika-#{version}/'*.otf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/Shobhika.ttc'
      SHELL
    ]
  end
end
