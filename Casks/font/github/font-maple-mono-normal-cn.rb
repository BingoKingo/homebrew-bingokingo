cask "font-maple-mono-normal-cn" do
  version "7.5"
  sha256 "6ee1638126b1d4064dc1db31abbcc2e25297c3fb5b79b9ea213c7f234846f9a8"

  url "https://github.com/subframe7536/Maple-font/releases/download/v#{version}/MapleMonoNormal-CN-unhinted.zip",
      verified: "github.com/subframe7536/Maple-font/"
  name "Maple Mono Normal CN"
  homepage "https://font.subf.dev/en/"

  livecheck do
    cask "font-maple-mono"
  end

  depends_on formula: "fonttools"

  font "MapleMonoNormal-CN.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/MapleMonoNormal-CN.ttc'
      SHELL
    ]
  end
end
