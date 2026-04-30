cask "eden" do
  version "0.2.0-rc2"
  sha256 "6987944af48380667c716a55b237620872d8402c98acd8f84346d278d87331cb"

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
