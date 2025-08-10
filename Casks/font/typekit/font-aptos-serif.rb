cask "font-aptos-serif" do
  version "0.1,1628854"
  sha256 "0af22b09ce23143bd2518da327481d9827145de09788c8a43a1234a0f1e22350"

  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/281042501",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "Aptos Serif"
  homepage "https://fonts.adobe.com/fonts/aptos-serif/"

  depends_on formula: "fonttools"

  font "AptosSerif.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/AptosSerif.ttc'
      SHELL
    ]
  end

  caveats do
    <<~EOS
      [L] Private files cannot be downloaded without permission.
    EOS
  end
end
