cask "font-pet-me" do
  version "1.0"
  sha256 "5a9aea0fd7bdf52106efdf9ef428fc3c1c48326cc54a2b9ce1ae35174857783b"

  url "https://www.ffonts.net/Pet-Me-64-2Y.font.zip"
  # url "https://web.archive.org/web/20250731144122/https://www.ffonts.net/Pet-Me-64-2Y.font.zip"
  name "Pet Me"
  homepage "https://www.ffonts.net/Pet-Me-64-2Y.font"

  depends_on formula: "fonttools"

  font "PetMe.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print \"\\\"\" \$0 \"\\\"\"}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/PetMe.ttc'
      SHELL
    ]
  end

  # No zap stanza required
end
