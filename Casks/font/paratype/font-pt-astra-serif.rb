cask "font-pt-astra-serif" do
  version "1.004"
  sha256 "0a3faf9b1b2ceae1b7058e06318e5c2de1e55ce1cc1cdc5d938db59798134769"

  url "https://api.paratype.com/api/editions/ofl/download/52179",
      referer: "https://www.paratype.com/"
  name "PT Astra Serif"
  homepage "https://www.paratype.com/fonts/pt/pt-astra-serif"

  depends_on formula: "fonttools"

  font "pt-astra-serif.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/PT/PT/PT-Astra-Serif/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/pt-astra-serif.ttc'
      SHELL
    ]
  end

  # No zap stanza required
end
