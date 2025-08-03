cask "font-microsoft-fluent-sitka-small" do
  version "1.0"
  sha256 "74e400e6a74f272608ddb16b98296f7d0b93f8423d2f0a64a850b3e1dd140dd7"

  url "https://download.microsoft.com/download/1/6/9/1698B73E-F6C5-44AD-B2CF-88D21D610897/Microsoft%20Fluent%20Fonts%20for%20non-Windows%20OS.zip"
  # url "https://web.archive.org/web/20230716201047/https://download.microsoft.com/download/1/6/9/1698B73E-F6C5-44AD-B2CF-88D21D610897/Microsoft%20Fluent%20Fonts%20for%20non-Windows%20OS.zip"
  name "Microsoft Fluent Sitka Small"
  homepage "https://www.microsoft.com/en-us/download/details.aspx?id=50721"

  font "Fluent_SitkaSmall-Bold.ttf"
  font "Fluent_SitkaSmall-BoldItalic.ttf"
  font "Fluent_SitkaSmall-Italic.ttf"
  font "Fluent_SitkaSmall.ttf"

  # No zap stanza required
end
