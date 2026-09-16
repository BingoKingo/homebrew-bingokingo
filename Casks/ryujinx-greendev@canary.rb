cask "ryujinx-greendev@canary" do
  version "1.3.351"
  sha256 "bcdac85194e89e6f5ad19282b91af7a5f8c8a08aa908040750b688028efa7212"

  url "https://git.ryujinx.app/Ryubing/Canary/releases/download/#{version}/ryujinx-canary-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Simple, experimental Nintendo Switch 1 emulator"
  homepage "https://git.ryujinx.app/ryubing/ryujinx/"

  livecheck do
    url "https://git.ryujinx.app/ryubing/canary.git"
  end

  auto_updates true
  conflicts_with cask: ["ryujinx", "ryujinx-greendev"]
  depends_on macos: :monterey

  app "Ryujinx.app"

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
