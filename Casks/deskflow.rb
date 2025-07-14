cask "deskflow" do
  arch arm: "arm64", intel: "x86_64"

  version "1.22.0"
  sha256 arm:   "7181966f1528fca707193484a404a2626bd8778dfe4838d2740f27b7b4868804",
         intel: "ecd1f3446d38ced3cb5fbf1651d599f3b454b3483bf0029ff9ae044f7042d3e5"

  url "https://github.com/deskflow/deskflow/releases/download/v#{version}/deskflow-#{version}-macos-#{arch}.dmg"
  name "Deskflow"
  desc "Mouse and keyboard sharing utility"
  homepage "https://github.com/deskflow/deskflow/"

  depends_on macos: ">= :monterey"

  app "Deskflow.app"
  binary "#{appdir}/Deskflow.app/Contents/MacOS/deskflow-client"
  binary "#{appdir}/Deskflow.app/Contents/MacOS/deskflow-server"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/Deskflow.app"
                   ]
  end

  zap trash: [
    "~/Library/Application Support/Deskflow",
    "~/Library/Deskflow",
    "~/Library/Preferences/Deskflow",
    "~/Library/Preferences/org.deskflow.Deskflow.plist",
    "~/Library/Saved Application State/Deskflow.savedState",
  ]
end
