cask "sideloadly" do
  version :latest
  sha256 :no_check

  url "https://sideloadly.io/SideloadlySetup.dmg"
  name "Sideloadly"
  desc "Sideload your favorite games and apps"
  homepage "https://sideloadly.io/"

  # auto_updates true

  app "Sideloadly.app"

  zap trash: [
    "~/Library/Saved Application State/com.sideloadly.sideloadly.savedState",
    "~/Library/Preferences/com.sideloadly.sideloadly.plist",
  ]
end
