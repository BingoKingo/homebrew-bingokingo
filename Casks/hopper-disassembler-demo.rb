cask "hopper-disassembler-demo" do
  version "6.2.6"
  sha256 "44ae4d8d156aa2f5d31bcc4c928976fd34ccbf751366b2f3b17ab631a32083ea"

  url "https://www.hopperapp.com/downloader/public/Hopper-#{version}-demo.dmg",
      user_agent: :browser
  name "Hopper Disassembler"
  desc "Reverse engineering tool to disassemble, decompile and debug your apps"
  homepage "https://www.hopperapp.com/index.html"

  livecheck do
    url "https://www.hopperapp.com/rss/changelog.php"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Hopper Disassembler.app"
  # app "Hopper Disassembler v#{version.major}.app"

  binary "#{appdir}/Hopper Disassembler.app/Contents/MacOS/hopper"

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

  # binary "#{appdir}/Hopper Disassembler v#{version.major}.app/Contents/MacOS/hopper"
  caveats do
    <<~EOS
      [R] Demo version cannot activate, more details from
      https://github.com/Homebrew/homebrew-cask/pull/49053
    EOS
  end
end
