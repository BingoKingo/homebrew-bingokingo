cask "font-courier-prime" do
  version "1.202,1.203"
  sha256 "d5d4faf1bee0d1f52bab1103cbfdfb354976331c86f999c110c22a098cb12d73"

  url "https://quoteunquoteapps.com/courierprime/downloads/courier-prime.zip"
  name "Courier Prime"
  homepage "https://quoteunquoteapps.com/courierprime/"

  depends_on formula: "fonttools"

  font "CourierPrime.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/Courier Prime/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/CourierPrime.ttc'
      SHELL
    ]
  end

  # No zap stanza required
end
