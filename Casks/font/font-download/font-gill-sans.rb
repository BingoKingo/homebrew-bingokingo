cask "font-gill-sans" do
  version "1.0"
  sha256 "76fb062a05179b7ffe9592f06aca521dc7874079abc7b50341faf63b6b4bca71"

  url "https://font.download/dl/font/gill-sans-2.zip"
  # url "https://web.archive.org/web/20250530222514/https://font.download/dl/font/gill-sans-2.zip"
  name "Gill Sans"
  homepage "https://font.download/font/gill-sans-2"

  depends_on formula: "fonttools"

  font "GillSans.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.otf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/GillSans.ttc'
      SHELL
    ]
  end

  # No zap stanza required
end
