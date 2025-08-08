cask "font-bitstream-vera-sans-mono-nerd-font" do
  version "3.4.0"
  sha256 "e245e428e58c6b4b74365f89bae9157c54377cfb7f266be223c25a60d1042f45"

  url "https://github.com/ryanoasis/nerd-fonts/releases/download/v#{version}/BitstreamVeraSansMono.zip"
  name "BitstromWera Nerd Font (Bitstream Vera Sans Mono)"
  homepage "https://github.com/ryanoasis/nerd-fonts"

  livecheck do
    url :url
    strategy :github_latest
  end

  no_autobump! because: :bumped_by_upstream

  depends_on formula: "fonttools"

  font "BitstromWeraNerdFont.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/BitstromWeraNerdFont.ttc'
      SHELL
    ]
  end

  # No zap stanza required
end
