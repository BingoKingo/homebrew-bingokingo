cask "ryujinx-greendev" do
  version "1.2.78"
  sha256 "7ede71b85925a8db38a27767d997d2d62a0a057b43d05e172b951ae439d8bb47"

  url "https://github.com/GreemDev/Ryujinx/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz",
      verified: "github.com/GreemDev/Ryujinx/"
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
