cask "font-convection" do
  version "1.15"
  sha256 "af09171e630a83fbcc9e22fcabab7fa514f8bed7030beec07f7fa1f82904ea8d"

  url "https://font.download/dl/font/convection.zip"
  # url "https://web.archive.org/web/20250603201039/https://font.download/dl/font/convection.zip"
  name "Convection"
  homepage "https://font.download/font/convection/"

  depends_on formula: "fonttools"

  font "Conv.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/opt/fonttools/bin/fonttools' ttLib \
        -o '#{staged_path}/Conv.ttc'
      SHELL
    ]
  end
end
