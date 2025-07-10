cask "ryujinx-greendev-canary" do
  version "1.3.96"
  sha256 "35710bc111d3b7146a99b03cb93af9120ac3a6200b587cb19291dd1d85b4dd23"

  url "https://git.ryujinx.app/api/v4/projects/68/packages/generic/Ryubing-Canary/#{version}/ryujinx-canary-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Simple, experimental Nintendo Switch emulator"
  homepage "https://git.ryujinx.app/ryubing/ryujinx/"

  auto_updates true

  app "ryujinx.app", target: "Ryujinx.app"

  zap trash: [
    "~/Library/Application Support/Ryujinx",
    "~/Library/Logs/Ryujinx",
    "~/Library/Preferences/org.ryujinx.Ryujinx.plist",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
