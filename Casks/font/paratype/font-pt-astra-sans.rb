cask "font-pt-astra-sans" do
  version "1.003"
  sha256 "cdca9d1b38d8ef1b242dcc82682aaa63ca55131e29faf07396da1a9489d3143c"

  url "https://api.paratype.com/api/editions/ofl/download/52180",
      referer: "https://www.paratype.com/"
  name "PT Astra Sans"
  homepage "https://www.paratype.com/fonts/pt/pt-astra-sans"

  depends_on formula: "fonttools"

  font "pt-astra-sans.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/PT/PT/PT-Astra-Sans/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/pt-astra-sans.ttc'
      SHELL
    ]
  end

  # No zap stanza required
end
