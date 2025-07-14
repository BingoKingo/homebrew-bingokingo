cask "ryujinx-greendev" do
  version "1.3.2"
  sha256 "c157907318348999ce4fb8c8fe8ddd511f0ddea643f22b1529527390180cb700"

  url "https://git.ryujinx.app/api/v4/projects/1/packages/generic/Ryubing/#{version}/ryujinx-#{version}-macos_universal.app.tar.gz"
  name "Ryujinx"
  desc "Simple, experimental Nintendo Switch emulator"
  homepage "https://git.ryujinx.app/ryubing/ryujinx/"

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
