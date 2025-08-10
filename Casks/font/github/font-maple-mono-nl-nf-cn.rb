cask "font-maple-mono-nl-nf-cn" do
  version "7.5"
  sha256 "7af34b409972d034e11d3d38a7d7fee732ffe1d3bae1ea13c6507e0833ca56b5"

  url "https://github.com/subframe7536/Maple-font/releases/download/v#{version}/MapleMonoNL-NF-CN-unhinted.zip",
      verified: "github.com/subframe7536/Maple-font/"
  name "Maple Mono NL NF CN"
  homepage "https://font.subf.dev/en/"

  livecheck do
    cask "font-maple-mono"
  end

  depends_on formula: "fonttools"

  font "MapleMonoNL-NF-CN.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/MapleMonoNL-NF-CN.ttc'
      SHELL
    ]
  end
end
