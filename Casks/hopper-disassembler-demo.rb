cask "hopper-disassembler-demo" do
  version "5.8.6"
  sha256 "bd52c4a673a562b8d0ff9d0f13da66ac976edfe9707ebfc75649fe44a5912c21"

  url "https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-#{version}-demo.dmg",
      verified: "d2ap6ypl1xbe4k.cloudfront.net/"
  name "Hopper Disassembler"
  desc "Reverse engineering tool to disassemble, decompile and debug your applications"
  homepage "https://www.hopperapp.com/index.html"

  livecheck do
    skip
  end

  auto_updates true

  app "Hopper Disassembler v4.app"
  binary "#{appdir}/Hopper Disassembler v4.app/Contents/MacOS/hopper"
  binary "#{appdir}/Hopper Disassembler v4.app/Contents/MacOS/hopper", target: "hopperv4"

  zap trash: [
    "~/Library/Caches/com.cryptic-apps.hopper-web-4",
    "~/Library/HTTPStorages/com.cryptic-apps.hopper-web-4",
    "~/Library/WebKit/com.cryptic-apps.hopper-web-4",
    "~/Library/Preferences/com.cryptic-apps.hopper-web-4.plist",
  ]
end
