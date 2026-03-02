cask "suyu" do
  version "0.0.3"
  sha256 "38dc1efdb59369656e2b98527534557294b575635c1387a2e9a6309d0ab3682c"

  url "https://git.suyu.dev/suyu/suyu/releases/download/v#{version}/Suyu-macOS-ARM64.zip"
  name "suyu"
  desc "Nintendo Switch 1 emulator in c++"
  homepage "https://suyu.dev/"

  livecheck do
    url "https://git.suyu.dev/suyu/suyu.git"
  end

  deprecate! date: "2024-10-06", because: :unmaintained

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "suyu.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-dr", "com.apple.quarantine", "#{appdir}/suyu.app"
                   ]
  end

  zap trash: [
    "~/.config/suyu",
    "~/.local/suyu",
    "~/Library/Preferences/com.suyu-emu.suyu.plist",
    "~/Library/Saved Application State/com.suyu-emu.suyu.savedState",
  ]
end
