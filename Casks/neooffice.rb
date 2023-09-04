cask "neooffice" do
  version "2022_7"
  sha256 "4288f77cb39c1b5bf4e903460d1863a93f50170eec170ccf24a2b8020a55d2e1"

  url "https://github.com/neooffice/NeoOffice/releases/download/NeoOffice-#{version}/NeoOffice-#{version.underscores_to_dots}_Professional_Edition-Universal.dmg",
      verified: "github.com/neooffice/NeoOffice/"
  name "NeoOffice"
  desc "Office suite fork based on OpenOffice and LibreOffice"
  homepage "https://www.neooffice.org/"

  depends_on macos: ">= :big_sur"

  pkg "Install NeoOffice #{version.underscores_to_dots} Professional Edition.pkg"

  uninstall pkgutil: [
    "org.neooffice.NeoOffice",
  ]

  zap trash: [
    "~/Library/Application Support/NeoOffice",
    "~/Library/Preferences/NeoOffice-4.0",
    "~/Library/Preferences/org.neooffice.NeoOffice.plist",
    "~/Library/Saved Application State/org.neooffice.NeoOffice.savedState",
  ]
end
