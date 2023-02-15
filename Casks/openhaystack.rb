cask "openhaystack" do
  version "0.5.2"
  url "https://github.com/seemoo-lab/openhaystack/releases/download/v#{version}/OpenHaystack.zip"
      verified: "github.com/seemoo-lab/openhaystack/"
  name "OpenHaystack"
  desc "Framework for tracking personal Bluetooth devices via Apple's Find My network"
  homepage "https://github.com/seemoo-lab/openhaystack"

  livecheck do
    url "https://github.com/seemoo-lab/openhaystack/releases"
    regex(%r{href=["']?[^"' >]*?/tree/v?(\d+(?:[.-]\d+)+)?(?:[._-]+?(\d+(?:\.\d+)*))?["' >]}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map do |match|
        (match.length > 1) ? "#{match[0]},#{match[1]}" : match[0]
      end
    end
  end

  auto_updates true

  app "OpenHaystack.app"

  zap trash: [
    "~/Library/Application Support/de.tu-darmstadt.seemoo.OpenHaystack",
    "~/Library/Caches/de.tu-darmstadt.seemoo.OpenHaystack",
    "~/Library/HTTPStorages/de.tu-darmstadt.seemoo.OpenHaystack",
    "~/Library/HTTPStorages/de.tu-darmstadt.seemoo.OpenHaystack.binarycookies",
    "~/Library/Preferences/de.tu-darmstadt.seemoo.OpenHaystack.plist",
  ]
end
