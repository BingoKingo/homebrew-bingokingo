cask "ryujinx-greendev@canary" do
  version "1.3.260"
  sha256 "8b21dc13fa550e8341947653dc858f899e44563b72030327738e908af799598b"

  url "https://git.ryujinx.app/api/v4/projects/68/packages/generic/Ryubing-Canary/#{version}/ryujinx-canary-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Simple, experimental Nintendo Switch 1 emulator"
  homepage "https://git.ryujinx.app/ryubing/ryujinx/"

  livecheck do
    url "https://git.ryujinx.app/ryubing/canary.git"
  end

  auto_updates true
  conflicts_with cask: ["ryujinx", "ryujinx-greendev"]
  depends_on macos: ">= :monterey"

  app "ryujinx.app", target: "Ryujinx.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-dr", "com.apple.quarantine", "#{appdir}/Ryujinx.app"
                   ]
  end

  zap trash: [
    "~/Library/Application Support/Ryujinx",
    "~/Library/Logs/Ryujinx",
    "~/Library/Preferences/org.ryujinx.Ryujinx.plist",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
