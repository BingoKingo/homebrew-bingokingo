cask "font-poppins" do
  version "4.003"
  sha256 "3a1a58cfc497b3a57a8a6ec51d62800ad42a50b9827b1e3297135bf5e860b1a0"

  url "https://github.com/itfoundry/Poppins/raw/master/products/Poppins-#{version}-GoogleFonts-OTF.zip"
  name "Poppins"
  homepage "https://github.com/itfoundry/poppins"

  depends_on formula: "fonttools"

  font "Poppins.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.otf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/Poppins.ttc'
      SHELL
    ]
  end

  # No zap stanza required
end
