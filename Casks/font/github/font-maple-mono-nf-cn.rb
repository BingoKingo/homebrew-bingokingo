cask "font-maple-mono-nf-cn" do
  version "7.5"
  sha256 "3bd076e9e0a0cd48397fe836abe4c299c34245a0c4ee043c5653159626f3e085"

  url "https://github.com/subframe7536/Maple-font/releases/download/v#{version}/MapleMono-NF-CN-unhinted.zip",
      verified: "github.com/subframe7536/Maple-font/"
  name "Maple Mono NF CN"
  homepage "https://font.subf.dev/en/"

  livecheck do
    cask "font-maple-mono"
  end

  depends_on formula: "fonttools"

  font "MapleMono-NF-CN.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/MapleMono-NF-CN.ttc'
      SHELL
    ]
  end
end
