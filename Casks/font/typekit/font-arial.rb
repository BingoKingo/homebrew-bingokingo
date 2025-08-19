cask "font-arial" do
  version "0.1,3812972"
  sha256 "3b0fb5884eb4c567a24cb1fc1bf2752533e7d65667928aa0ac44be4f81712560"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/284284034",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Arial"
  homepage "https://fonts.adobe.com/fonts/arial/"

  depends_on formula: "fonttools"

  font "Arial.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/Arial.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
