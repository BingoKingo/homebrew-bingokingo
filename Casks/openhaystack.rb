cask "openhaystack" do
  version "0.5.2"
  sha256 "c1e267f4aab1a0bf118ea421d547c3da0729555a1a89ed388c89a7d11a4a5ac5"

  url "https://github.com/seemoo-lab/openhaystack/releases/download/v#{version}/OpenHaystack.zip"
  name "OpenHaystack"
  desc "Framework for tracking personal Bluetooth devices via Apple's Find My network"
  homepage "https://github.com/seemoo-lab/openhaystack/"

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "OpenHaystack.app"

  zap trash: [
    "~/Library/Application Support/de.tu-darmstadt.seemoo.OpenHaystack",
    "~/Library/Caches/de.tu-darmstadt.seemoo.OpenHaystack",
    "~/Library/HTTPStorages/de.tu-darmstadt.seemoo.OpenHaystack",
    "~/Library/HTTPStorages/de.tu-darmstadt.seemoo.OpenHaystack.binarycookies",
    "~/Library/Preferences/de.tu-darmstadt.seemoo.OpenHaystack.plist",
  ]
end
