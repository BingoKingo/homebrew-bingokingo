# [R] Demo version cannot activate, more details from https://github.com/Homebrew/homebrew-cask/pull/49053#issuecomment-401153827
cask "hopper-disassembler-demo" do
  version "5.19.5"
  sha256 "1b319a69f02cd139ddb64667dcb172400efbda2e7b70c715348889c39a3c8ced"

  url "https://www.hopperapp.com/downloader/hopperv4/Hopper-#{version}-demo.dmg",
      user_agent: :browser
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
