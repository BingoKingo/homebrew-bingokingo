cask "font-a-charming-font" do
  version "1.03"
  sha256 "8ae8664c80ccb9bc0bce849a35310e29cd1f09b27a686a2d512c89291a458604"

  url "https://dl.dafont.com/dl/?f=a_charming_font"
  name "A Charming Font"
  homepage "https://www.dafont.com/a-charming-font.font"

  depends_on formula: "fonttools"

  font "Achaf.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/Achaf.ttc'
      SHELL
    ]
  end
end
