cask "sideloadly" do
  version "0.60"
  sha256 :no_check

  url "https://sideloadly.io/SideloadlySetup.dmg"
  name "Sideloadly"
  desc "Sideload games and apps"
  homepage "https://sideloadly.io/"

  livecheck do
    url "https://sideloadly.io/exe/darwin-amd64.json"
    strategy :json do |json|
      json["Version"]
    end
  end

  auto_updates true

  app "Sideloadly.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-dr", "com.apple.quarantine", "#{appdir}/Sideloadly.app"
                   ]
  end

  uninstall quit: "io.sideloadly.sideloadly"

  zap trash: [
    "~/Library/Application Support/sideloadly",
    "~/Library/Preferences/com.sideloadly.sideloadly.plist",
    "~/Library/Saved Application State/com.sideloadly.sideloadly.savedState",
  ]
end
