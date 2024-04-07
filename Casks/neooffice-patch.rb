cask "neooffice-patch" do
  version "2022_7"
  sha256 "1d046057bf9507d1d8abfa061cfbca794e0eb6f3ac148c8e29c024f4375abafe"

  url "https://github.com/neooffice/NeoOffice/releases/download/NeoOffice-#{version}/NeoOffice-#{version.underscores_to_dots}_Professional_Edition-Patch-0-Universal.dmg",
      verified: "github.com/neooffice/NeoOffice/"
  name "NeoOffice"
  desc "Patch of NeoOffice"
  homepage "https://www.neooffice.org/"

  depends_on macos: ">= :big_sur"
  depends_on cask: "neooffice"

  pkg "Install NeoOffice #{version.underscores_to_dots} Professional Edition Patch 0.pkg"

  uninstall pkgutil: "org.neooffice.NeoOffice_patch.pkg"

  zap trash: [
    "~/Library/Application Support/NeoOffice",
    "~/Library/Preferences/NeoOffice-4.0",
    "~/Library/Preferences/org.neooffice.NeoOffice.plist",
    "~/Library/Saved Application State/org.neooffice.NeoOffice.savedState",
  ]
end
