cask "fontfinagler" do
  version "2.0"
  sha256 "8be1ef3249cc0b206e5a726603c842b86339597062ce3c1d734bd89f6fd69def"

  url "https://markdouma.com/fontfinagler/FontFinagler#{version}.dmg"
  # appcast "https://markdouma.com/fontfinagler/packageVersion.php"
  name "Font Finagler"
  desc "Help troubleshoot misbehaving fonts"
  homepage "https://markdouma.com/fontfinagler/"

  livecheck do
    skip
  end

  auto_updates true

  app "Font Finagler.app"
  binary "#{appdir}/Font Finagler.app/Contents/MacOS/finagler"

  zap trash: [
    "~/Library/HTTPStorages/com.markdouma.FontFinagler",
    "~/Library/HTTPStorages/com.markdouma.FontFinagler.binarycookies",
    "~/Library/Preferences/com.markdouma.FontFinagler.plist",
  ]
end
