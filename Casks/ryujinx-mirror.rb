cask "ryujinx-mirror" do
  version "49574a9"
  sha256 "4549b8cb80d06dfc7be9107d5810f2aff132a99e021a32b14be767c94c686385"

  url "https://github.com/ryujinx-mirror/ryujinx/releases/download/r.#{version}/ryujinx-r.#{version}-macos_universal.app.tar.gz",
      verified: "github.com/ryujinx-mirror/ryujinx/"
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
