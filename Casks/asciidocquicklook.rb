cask "asciidocquicklook" do
  version "1.0.1"
  sha256 "1fdc48041c3b9e35d151fb8325e71df81ea3c34cbb7975cbd6728a0382e04709"

  url "https://github.com/clydeclements/AsciiDocQuickLook/releases/download/v#{version}/AsciiDoc.qlgenerator.zip"
  name "AsciiDocQuickLook"
  desc "QuickLook plugin for AsciiDoc files"
  homepage "https://github.com/clydeclements/AsciiDocQuickLook/"

  qlplugin "AsciiDoc.qlgenerator"
end
