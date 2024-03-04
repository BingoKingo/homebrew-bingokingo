# [R] Demo version cannot activate, more details from https://github.com/Homebrew/homebrew-cask/pull/49053#issuecomment-401153827
cask "hopper-disassembler-demo" do
  version "5.14.2"
  sha256 "7e4cf533d7e34dd3b0b1b17abe696610bd73993eeb7ca92e6304170534dee007"

  url "https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-#{version}-demo.dmg",
      verified: "d2ap6ypl1xbe4k.cloudfront.net/"
  name "Hopper Disassembler"
  desc "Reverse engineering tool to disassemble, decompile and debug your apps"
  homepage "https://www.hopperapp.com/index.html"

  livecheck do
    url "https://www.hopperapp.com/rss/changelog.php"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Hopper Disassembler v4.app"
  # app "Hopper Disassembler v#{version.major}.app"

  binary "#{appdir}/Hopper Disassembler v4.app/Contents/MacOS/hopper"

  # binary "#{appdir}/Hopper Disassembler v#{version.major}.app/Contents/MacOS/hopper"

  zap trash: [
    "~/Library/Application Support/Hopper Disassembler v4",
    # "~/Library/Application Support/Hopper Disassembler v#{version.major}",
    "~/Library/Application Support/Hopper",
    "~/Library/Caches/com.cryptic-apps.hopper-web-4",
    # "~/Library/Caches/com.cryptic-apps.hopper-web-#{version.major}",
    "~/Library/HTTPStorages/com.cryptic-apps.hopper-web-4",
    # "~/Library/HTTPStorages/com.cryptic-apps.hopper-web-#{version.major}",
    "~/Library/Preferences/com.cryptic-apps.hopper-web-4.plist",
    # "~/Library/Preferences/com.cryptic-apps.hopper-web-#{version.major}.plist",
    "~/Library/Saved Application State/com.cryptic-apps.hopper-web-4.savedState",
    # "~/Library/Saved Application State/com.cryptic-apps.hopper-web-#{version.major}.savedState",
    "~/Library/WebKit/com.cryptic-apps.hopper-web-4",
    # "~/Library/WebKit/com.cryptic-apps.hopper-web-#{version.major}",
  ]
end
