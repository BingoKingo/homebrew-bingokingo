cask "sideloadly" do
  version :latest
  sha256 :no_check

  url "https://sideloadly.io/SideloadlySetup.dmg"
  name "Sideloadly"
  desc "Sideload games and apps"
  homepage "https://sideloadly.io/"

  auto_updates true

  app "Sideloadly.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/Sideloadly.app"
                   ]
  end

  uninstall quit: "io.sideloadly.sideloadly"

  zap trash: [
    "~/Library/Application Support/sideloadly",
    "~/Library/Preferences/com.sideloadly.sideloadly.plist",
    "~/Library/Saved Application State/com.sideloadly.sideloadly.savedState",
  ]
end
