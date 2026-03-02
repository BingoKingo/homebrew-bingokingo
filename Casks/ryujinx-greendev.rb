cask "ryujinx-greendev" do
  version "1.3.3"
  sha256 "e4818bb84c98e0d3120691821e90772099e46101273d3f145ffdb10eee2c0dbb"

  url "https://git.ryujinx.app/api/v4/projects/1/packages/generic/Ryubing/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Simple, experimental Nintendo Switch 1 emulator"
  homepage "https://git.ryujinx.app/ryubing/ryujinx/"

  livecheck do
    url "https://git.ryujinx.app/ryubing/ryujinx.git"
    regex(/^(\d+\.\d+\.\d+)$/)
  end

  auto_updates true
  conflicts_with cask: ["ryujinx", "ryujinx-greendev@canary"]
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
