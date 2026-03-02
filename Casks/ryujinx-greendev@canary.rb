cask "ryujinx-greendev@canary" do
  version "1.3.243"
  sha256 "2e9117b3f3275ce9f7453e5ba9be434295a2d86a60662d95b4026c823ed4d9a2"

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
