cask "neooffice" do
  version "2022_6"
  sha256 "d4a54be120a4a6052f7f34fd37fb5f9eda70fa87a56798564d78ad343da9cad2"

  ver = "2022.6"

  url "https://github.com/neooffice/NeoOffice/releases/download/NeoOffice-#{version}/NeoOffice-#{ver}_Professional_Edition-Universal.dmg",
      verified: "github.com/neooffice/NeoOffice/"
  name "NeoOffice"
  desc "Office suite fork based on OpenOffice and LibreOffice"
  homepage "https://www.neooffice.org/"

  depends_on cask: "neooffice-patch"

  pkg "Install NeoOffice #{ver} Professional Edition.pkg"

  uninstall pkgutil: [
    "org.neooffice.NeoOffice",
    "org.neooffice.NeoOffice_patch.pkg",
  ]

  zap trash: [
    "~/Library/Application Support/NeoOffice",
    "~/Library/Preferences/NeoOffice-4.0",
    "~/Library/Saved Application State/org.neooffice.NeoOffice.savedState",
    "~/Library/Preferences/org.neooffice.NeoOffice.plist",
  ]
end
