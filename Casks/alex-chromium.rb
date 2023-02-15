cask "alex-chromium" do
  arch arm: "ARM64", intel: "X64"
  version "109.0.5414.120-2"
  url "https://github.com/Alex313031/Thorium-Special/releases/download/M#{version}/Thorium_MacOS_#{arch}.dmg"
      verified: "github.com/Alex313031/Thorium-Special/"
  name "Thorium"
  desc "Chromium fork named after radioactive element No. 90"
  homepage "https://thorium.rocks/"

  # livecheck do
  #   url "https://github.com/Alex313031/Thorium-Special/releases?q=macos"
  #   regex(%r{href=["']?[^"' >]*?/tree/M?(\d+(?:[._-]\d+)+)?(\d+(?:\.\d+)*)?["' >]}i)
  #   strategy :page_match do |page, regex|
  #     page.scan(regex).map do |match|
  #       (match.length > 1) ? "#{match[0]},#{match[1]}" : match[0]
  #     end
  #   end
  # end

  # conflicts_with cask: [
  #   "chromium",
  #   "freesmug-chromium",
  #   "eloston-chromium"
  # ]

  app "Thorium.app"

  zap trash: [
    "~/Library/Application Support/Thorium",
    "~/Library/Caches/Thorium",
    "~/Library/Preferences/org.chromium.Thorium.plist",
    "~/Library/Saved Application State/org.chromium.Thorium.savedState",
  ]
end
