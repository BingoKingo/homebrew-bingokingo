# [O] Archived.
cask "figmafiledownloader" do
  version "1.0.54"
  sha256 "5790c8ceb15d865de912689d7d482121cba3e893b133eb72eb7b7b68bf4ae8b1"

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
