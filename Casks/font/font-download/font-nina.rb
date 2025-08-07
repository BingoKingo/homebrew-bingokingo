cask "font-nina" do
  version "1.01,1.06"
  sha256 "e91018146170aa61b8440881d59c0686cb9a3a7a1bad817a790821489943bfea"

  url "https://font.download/dl/font/nina.zip"
  # url "https://web.archive.org/web/20250731144516/https://font.download/dl/font/nina.zip"
  name "Nina"
  homepage "https://font.download/font/nina"

  depends_on formula: "fonttools"

  font "Nina.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/Nina.ttc'
      SHELL
    ]
  end

  # No zap stanza required
end
