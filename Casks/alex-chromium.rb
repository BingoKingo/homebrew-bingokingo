cask "alex-chromium" do
  arch arm: "ARM64", intel: "X64"

  version "109.0.5414.120-2"
  sha256 "1d49f062c8806b282aadec0504bc7b756a2805c82cae41e675206acfae198610"

  url "https://github.com/Alex313031/Thorium-Special/releases/download/M#{version}/Thorium_MacOS_#{arch}.dmg",
      verified: "github.com/Alex313031/Thorium-Special/"
  name "Thorium"
  desc "Chromium fork named after radioactive element No. 90"
  homepage "https://thorium.rocks/"

  # conflicts_with cask: [
  #   "chromium",
  #   "freesmug-chromium",
  #   "eloston-chromium"
  # ]

  app "Thorium.app"
  binary "#{appdir}/Thorium.app/Contents/MacOS/Thorium"

  zap trash: [
    "~/Library/Application Support/Thorium",
    "~/Library/Caches/Thorium",
    "~/Library/Preferences/org.chromium.Thorium.plist",
    "~/Library/Saved Application State/org.chromium.Thorium.savedState",
  ]
end
