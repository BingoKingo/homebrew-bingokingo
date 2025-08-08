cask "font-pt-serif" do
  version "1.002"
  sha256 "4e4a38900cb21e8fe1df4cff1955519abf219a42a0ad0a83327d068a142e89b7"

  url "https://api.paratype.com/api/editions/ofl/download/52194",
      referer: "https://www.paratype.com/"
  name "PT Serif"
  homepage "https://www.paratype.com/fonts/pt/pt-serif"

  depends_on formula: "fonttools"

  font "pt-serif.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/PT/PT/PT-Serif/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/pt-serif.ttc'
      SHELL
    ]
  end

  # No zap stanza required
end
