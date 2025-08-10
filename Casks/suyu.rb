cask "suyu" do
  version "0.0.1"
  sha256 "cac09d4878ea80cacb173a4ed6bb759790e99a7ca581b79c46cfcd4f16931878"

  url "https://git.suyu.dev/suyu/suyu/releases/download/v#{version}/Suyu-macOS_Arm64.dmg"
  name "suyu"
  desc "Nintendo Switch 1 emulator in c++"
  homepage "https://suyu.dev/"

  deprecate! date: "2024-10-06", because: :unmaintained

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "suyu.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/suyu.app"
                   ]
  end

  zap trash: [
    "~/.config/suyu",
    "~/.local/suyu",
    "~/Library/Preferences/com.suyu-emu.suyu.plist",
    "~/Library/Saved Application State/com.suyu-emu.suyu.savedState",
  ]
end
