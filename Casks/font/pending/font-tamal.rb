cask "font-tamal" do
  version "1.0"
  sha256 "7096f0b15f1f4bfa7dbd82042bd54a05f1f6ccc2ae094410050f62b5ea234f9e"

  url "https://www.wfonts.com/download/data/2015/08/16/tamal/tamal.zip"
  name "Tamal"
  homepage "https://www.wfonts.com/font/tamal"

  depends_on formula: "fonttools"

  font "Tamal.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print "\\"" $0 "\\""}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/Tamal.ttc'
      SHELL
    ]
  end
end
