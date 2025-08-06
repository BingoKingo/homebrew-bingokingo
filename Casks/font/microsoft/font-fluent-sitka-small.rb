cask "font-fluent-sitka-small" do
  version "1.10"
  sha256 "74e400e6a74f272608ddb16b98296f7d0b93f8423d2f0a64a850b3e1dd140dd7"

  url "https://download.microsoft.com/download/1/6/9/1698B73E-F6C5-44AD-B2CF-88D21D610897/Microsoft%20Fluent%20Fonts%20for%20non-Windows%20OS.zip"
  # url "https://web.archive.org/web/20230716201047/https://download.microsoft.com/download/1/6/9/1698B73E-F6C5-44AD-B2CF-88D21D610897/Microsoft%20Fluent%20Fonts%20for%20non-Windows%20OS.zip"
  name "Microsoft Fluent Sitka Small"
  homepage "https://www.microsoft.com/en-us/download/details.aspx?id=50721"

  depends_on formula: "fonttools"

  font "FluentSitkaSmall.ttc"

  preflight do
    system_command "/bin/bash", args: [
      "-c", <<~SHELL
        ls '#{staged_path}/'*.ttf \
        | awk '{print \"\\\"\" \$0 \"\\\"\"}' \
        | xargs '#{HOMEBREW_PREFIX}/bin/fonttools' ttLib \
        -o '#{staged_path}/FluentSitkaSmall.ttc'
      SHELL
    ]
  end

  # No zap stanza required
end
