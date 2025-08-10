cask "font-maple-mono-normal-nl-cn" do
  version "7.5"
  sha256 "594be01a45bd0b78d280e49fb22f13f053c3a446bd1614b38a211d2e4dd60e0a"

  url "https://github.com/subframe7536/Maple-font/releases/download/v#{version}/MapleMonoNormalNL-CN-unhinted.zip",
      verified: "github.com/subframe7536/Maple-font/"
  name "Maple Mono Normal NL CN"
  homepage "https://font.subf.dev/en/"

  livecheck do
    cask "font-maple-mono"
  end

  depends_on formula: "fonttools"

  font "MapleMonoNormalNL-CN.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/MapleMonoNormalNL-CN.ttc'
      SHELL
    ]
  end
end
