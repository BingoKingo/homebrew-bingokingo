cask "bootbuddy" do
  version "1.0.1"
  sha256 "bda2e28c06659c7e053de594f2d0bc8912ca13eeea78c60f7186bcd136e9dca3"

  url "https://github.com/MacEnhance/appcast/raw/master/BootBuddy/BootBuddy.#{version}.zip",
      verified: "github.com/MacEnhance/appcast/"
  name "BootBuddy"
  desc "Make your boot and login screens pop"
  homepage "https://www.macenhance.com/bootbuddy.html"

  livecheck do
    url "https://raw.githubusercontent.com/MacEnhance/appcast/master/BootBuddy/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :mojave"

  app "BootBuddy.app"

  zap trash: [
    "~/Library/Application Support/com.macenhance.BootBuddy",
    "~/Library/Caches/com.macenhance.BootBuddy",
    "~/Library/HTTPStorages/com.macenhance.BootBuddy",
    "~/Library/HTTPStorages/com.macenhance.BootBuddy.binarycookies",
    "~/Library/Preferences/com.macenhance.BootBuddy.plist",
  ]

  caveats do
    <<~EOS
          [R] Not ready for acceptance because of obscurity,
      more details from https://github.com/Homebrew/homebrew-cask/issues/112655
    EOS
  end
end
