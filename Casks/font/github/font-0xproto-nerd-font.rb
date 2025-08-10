cask "font-0xproto-nerd-font" do
  version "3.4.0"
  sha256 "e50e7fec9efbe1eb986b65f01e210098e122a3f495db24e6624bdcbca52da11d"

  url "https://github.com/ryanoasis/nerd-fonts/releases/download/v#{version}/0xProto.zip"
  name "0xProto Nerd Font (0xProto)"
  homepage "https://github.com/ryanoasis/nerd-fonts"

  livecheck do
    url :url
    strategy :github_latest
  end

  no_autobump! because: :bumped_by_upstream

  depends_on formula: "fonttools"

  font "0xProtoNerdFont.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/0xProtoNerdFont.ttc'
      SHELL
    ]
  end
end
