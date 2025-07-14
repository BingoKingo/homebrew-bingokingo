# [O] Archived.
cask "ryujinx" do
  version "1.1.1403"
  sha256 "07083574edf1a4a19d0ef4c82ef1baa07cca8465395350a750073f083d0c4053"

  # Removed official version
  # test-ava version use same file in this version release
  # url "https://github.com/Ryujinx/release-channel-master/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz",
  #     # url "https://github.com/Ryujinx/release-channel-master/releases/download/#{version}/test-ava-ryujinx-#{version}-macos_universal.app.tar.gz",
  #     verified: "github.com/Ryujinx/release-channel-master/"
  # Julienraptor01's archived version
  url "https://github.com/Julienraptor01/Ryujinx/releases/download/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz",
      # url "https://github.com/Julienraptor01/Ryujinx/releases/download/#{version}/test-ava-ryujinx-#{version}-macos_universal.app.tar.gz",
      verified: "github.com/Julienraptor01/Ryujinx/"
  name "Ryujinx"
  desc "Simple, experimental Nintendo Switch emulator"
  homepage "https://ryujinx.org/"

  auto_updates true

  app "ryujinx.app", target: "Ryujinx.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/Ryujinx.app"
                   ]
  end

  zap trash: [
    "~/Library/Application Support/Ryujinx",
    "~/Library/Logs/Ryujinx",
    "~/Library/Preferences/org.ryujinx.Ryujinx.plist",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
