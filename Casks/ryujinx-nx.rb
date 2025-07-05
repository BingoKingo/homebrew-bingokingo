cask "ryujinx-nx" do
  version "1.1.0+d890fff"
  sha256 "e8db5478648d11355e846e86a2eedf562fc031aa71f63e3f51c5406fd89d9676"

  url "https://github.com/Ryujinx-NX/Ryujinx/releases/download/Release/ryujinx-Release-#{version}-macos_universal.zip",
      verified: "github.com/Ryujinx-NX/Ryujinx/"
  name "Ryujinx"
  desc "Simple, experimental Nintendo Switch emulator"
  homepage "https://ryujinx.org/"

  auto_updates true

  app "ryujinx.app", target: "Ryujinx.app"

  zap trash: [
    "~/Library/Application Support/Ryujinx",
    "~/Library/Logs/Ryujinx",
    "~/Library/Preferences/org.ryujinx.Ryujinx.plist",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
