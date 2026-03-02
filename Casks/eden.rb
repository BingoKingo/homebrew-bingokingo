cask "eden" do
  version "0.2.0-rc1"
  sha256 "c1fec63d61d9346eb69e3bc63fcd1610b879df1f9ef492e83cd9e27aa081f654"

  url "https://git.eden-emu.dev/eden-emu/eden/releases/download/v#{version}/Eden-macOS-v#{version}.tar.gz"
  name "eden"
  desc "Nintendo Switch 1 emulator in c++"
  homepage "https://eden-emu.dev/"

  livecheck do
    url "https://git.eden-emu.dev/eden-emu/eden/releases"
    regex(/Eden-macOS-v([0-9.]+(?:-rc\d+)?)\.tar\.gz/i)
  end

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  # conflict_with cask: "yuzu"

  app "eden.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-dr", "com.apple.quarantine", "#{appdir}/eden.app"
                   ]
  end

  zap trash: [
    "~/.config/eden",
    "~/.local/share/eden",
    "~/Library/Preferences/com.yuzu-emu.yuzu.plist",
  ]
end
