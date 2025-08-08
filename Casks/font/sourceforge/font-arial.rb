cask "font-arial" do
  version "2.82"
  sha256 "85297a4d146e9c87ac6f74822734bdee5f4b2a722d7eaa584b7f2cbf76f478f6"

  url "https://downloads.sourceforge.net/corefonts/arial32.exe"
  name "Arial"
  homepage "https://sourceforge.net/projects/corefonts/files/the%20fonts/final/"

  depends_on formula: "fonttools"

  font "Arial.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.TTF \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/Arial.ttc'
      SHELL
    ]
  end

  # No zap stanza required
end
