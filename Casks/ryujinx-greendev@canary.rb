cask "ryujinx-greendev@canary" do
  version "1.3.265"
  sha256 "86a16ffd24b68c0fdf3f7c61e89f2289fa88ceed058b08334780108235410cc4"

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
