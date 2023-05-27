cask "figmafiledownloader" do
  version "1.0.53"
  sha256 "7b5acd51c0d5bb1de23424aedb5d6d23f0f2b7b2b327be39dfc0fe7cd08f7568"

  url "https://figmafile.com/figmaFileDownloader_#{version}.dmg.zip"
  name "Figma File Downloader"
  desc "Easy backup your Figma files"
  homepage "https://figmafile.com/"

  livecheck do
    skip
  end

  app "figmaFileDownloader.app"

  zap trash: [
    "~/Library/Application Support/figmaFileDownloader",
    "~/Library/Preferences/figmafile.com.app.plist",
    "~/Library/Saved Application State/figmafile.com.app.savedState",
  ]
end
