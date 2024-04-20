# [F] Forked application, modified from: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/a/aegisub.rb
cask "aegisub-arch1t3cht" do
  version "11"
  sha256 "7804a7c7f648659cbe5d5317fd7b30e14de7168c4ea682f6a9493fd755a09ea5"

  base_version="3.2.2"
  url "https://github.com/arch1t3cht/Aegisub/releases/download/feature_#{version}/macOS.Release.-.installer.zip"
  name "Aegisub"
  desc "Create and modify subtitles"
  homepage "https://github.com/arch1t3cht/Aegisub/"

  container nested: "Aegisub-#{base_version}.dmg"

  app "Aegisub.app"

  uninstall quit: "com.aegisub.aegisub"

  zap trash: [
    "~/Library/Application Support/Aegisub",
    "~/Library/Preferences/com.aegisub.aegisub.plist",
    "~/Library/Saved Application State/com.aegisub.aegisub.savedState",
  ]
end
