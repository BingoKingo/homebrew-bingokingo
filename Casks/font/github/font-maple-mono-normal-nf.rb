cask "font-maple-mono-normal-nf" do
  version "7.5"
  sha256 "72591bd191ae67c3a1d6991d7bcba6bf4ea42d9fedf4e95afd51b44abb7dd1f2"

  url "https://github.com/subframe7536/Maple-font/releases/download/v#{version}/MapleMonoNormal-NF-unhinted.zip",
      verified: "github.com/subframe7536/Maple-font/"
  name "Maple Mono Normal NF"
  homepage "https://font.subf.dev/en/"

  livecheck do
    cask "font-maple-mono"
  end

  depends_on formula: "fonttools"

  font "MapleMonoNormal-NF.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/MapleMonoNormal-NF.ttc'
      SHELL
    ]
  end
end
