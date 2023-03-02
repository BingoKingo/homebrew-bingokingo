cask "neooffice-patch" do
  version "2022_6"
  sha256 "b0d451831e9eeef1141addea244538dbc30c005dd7c4078f3998dcf68b42a8d0"

  ver = "2022.6"

  url "https://github.com/neooffice/NeoOffice/releases/download/NeoOffice-#{version}/NeoOffice-#{ver}_Professional_Edition-Patch-0-Universal.dmg",
      verified: "github.com/neooffice/NeoOffice/"
  name "NeoOffice"
  desc "Patch of NeoOffice"
  homepage "https://www.neooffice.org/"

  depends_on cask: "neooffice"

  pkg "Install NeoOffice #{ver} Professional Edition Patch 0.pkg"

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
