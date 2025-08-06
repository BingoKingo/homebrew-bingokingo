cask "font-tupo-vyaz" do
  version "1.000"
  sha256 "efc12235ce3b10d5c8be84514e5b7cabb588af09fa61b99ba754f8766d0ab126"

  url "https://api.paratype.com/api/editions/ofl/download/65273",
      referer: "https://www.paratype.com/"
  name "Tupo Vyaz"
  homepage "https://www.paratype.com/fonts/pt/tupo-vyaz/"

  depends_on formula: "fonttools"

  font "TupoVyaz.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/PT/PT/Tupo-Vyaz/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/TupoVyaz.ttc'
      SHELL
    ]
  end

  # No zap stanza required
end
