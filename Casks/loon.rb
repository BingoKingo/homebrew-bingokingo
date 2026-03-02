cask "loon" do
  version "0.2.0,57"
  sha256 "b36bc66fddf3e11e63bdac014f2eec903c5cc060a7e82a3867ba914ddad92ad0"

  url "https://github.com/Loon0x00/Loon4Mac/releases/download/#{version.csv.first}(#{version.csv.second})/Loon-#{version.csv.first}-beta-#{version.csv.second}.dmg"
  name "Loon"
  desc "Network utility"
  homepage "https://github.com/Loon0x00/Loon4Mac/"

  livecheck do
    url "https://github.com/Loon0x00/Loon4Mac/releases.atom"
    regex(/(\d+(?:\.\d+)*)\((\d+)\)/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  depends_on macos: ">= :ventura"

  app "Loon.app"

  zap trash: [
    "/Library/LaunchDaemons/com.loon.Loon.LoonHelper.plist",
    "/Library/PrivilegedHelperTools/com.loon.Loon.LoonHelper",
    "/Users/Shared/com.loon.Loon",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.loon.loon.sfl*",
    "~/Library/Application Support/com.loon.Loon",
    "~/Library/Caches/com.loon.Loon",
    "~/Library/HTTPStorages/com.loon.Loon",
    "~/Library/Preferences/com.loon.Loon.plist",
    "~/Library/WebKit/com.loon.Loon",
  ]
end
