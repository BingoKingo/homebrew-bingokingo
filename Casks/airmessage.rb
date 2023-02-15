cask "airmessage" do
  version "4.1.4"
  url "https://github.com/airmessage/airmessage-server/releases/download/v#{version}/AirMessage-#{version}.zip"
      verified: "github.com/airmessage/airmessage-server/"
  name "AirMessage Server"
  desc "Native message relay server for iMessages and FaceTime"
  homepage "https://airmessage.org/"

  livecheck do
    url "https://github.com/airmessage/airmessage-server/releases?q=prerelease%3Afalse"
    regex(%r{href=["']?[^"' >]*?/tree/v?(\d+(?:[.-]\d+)+)?(?:[._-]+?(\d+(?:\.\d+)*))?["' >]}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map do |match|
        (match.length > 1) ? "#{match[0]},#{match[1]}" : match[0]
      end
    end
  end

  auto_updates true

  app "AirMessage.app"

  zap trash: [
    "~/Library/Application Support/AirMessage",
    "~/Library/Caches/me.tagavari.airmessageserver",
    "~/Library/HTTPStorages/me.tagavari.airmessageserver",
    "~/Library/Preferences/me.tagavari.airmessageserver.plist",
  ]
end
