cask "openhaystack" do
  version "0.5.3"
  sha256 "593de581b0daf2784901237528c312006fb3e23b1deddf09457c6b7708e2e010"

  url "https://github.com/seemoo-lab/openhaystack/releases/download/v#{version}/OpenHaystack.zip"
  name "OpenHaystack"
  desc "Framework for tracking personal Bluetooth devices via Apple's Find My network"
  homepage "https://github.com/seemoo-lab/openhaystack/"

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "OpenHaystack.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/OpenHaystack.app"
                   ]
  end

  zap trash: [
    "~/Library/Application Support/de.tu-darmstadt.seemoo.OpenHaystack",
    "~/Library/Caches/de.tu-darmstadt.seemoo.OpenHaystack",
    "~/Library/HTTPStorages/de.tu-darmstadt.seemoo.OpenHaystack",
    "~/Library/HTTPStorages/de.tu-darmstadt.seemoo.OpenHaystack.binarycookies",
    "~/Library/Preferences/de.tu-darmstadt.seemoo.OpenHaystack.plist",
  ]
end
