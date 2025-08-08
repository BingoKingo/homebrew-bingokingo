cask "font-pt-sans" do
  version "2.005,2.006"
  sha256 "346270e324ff1559af346d046895d403dc4b9c98bff742987dcf0b82eec95aea"

  url "https://api.paratype.com/api/editions/ofl/download/52212",
      referer: "https://www.paratype.com/"
  name "PT Sans"
  homepage "https://www.paratype.com/fonts/pt/pt-sans"

  depends_on formula: "fonttools"

  font "pt-sans.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/PT/PT/PT-Sans/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/pt-sans.ttc'
      SHELL
    ]
  end

  # No zap stanza required
end
