cask "stash-mac" do
  version :latest
  sha256 :no_check

  url "https://mac-release-static.stash.ws/Stash-latest.zip"
  name "Stash"
  desc "Sideload your favorite games and apps"
  homepage "https://stash.ws/"

  auto_updates true

  app "Stash.app"

  zap trash: [
    "~/Library/HTTPStorages/ws.stash.app.mac.binarycookies",
    "~/Library/Preferences/ws.stash.app.mac.plist",
    "~/Library/HTTPStorages/ws.stash.app.mac",
    "~/Library/Group Containers/group.ws.stash.app",
    "~/Library/Application Support/Stash",
    "~/Library/Application Support/ws.stash.app.mac",
    "~/Library/Application Scripts/ws.stash.app.mac-LaunchAtLoginHelper",
    "/Library/PrivilegedHelperTools/ws.stash.app.mac.daemon.helper",
    "/Library/LaunchDaemons/ws.stash.app.mac.daemon.helper.plist",
  ]
end
