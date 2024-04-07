cask "reality-converter" do
  version "1.0,52"
  sha256 :no_check

  url "https://developer.apple.com/augmented-reality/tools/files/Reality_Converter_beta_5.dmg"
  name "Reality Converter"
  desc "Convert, view, and customize USDZ 3D objects"
  homepage "https://developer.apple.com/download/applications/"

  depends_on macos: ">= :monterey"
  container nested: "RealityConverter.pkg"

  pkg "RealityConverter.pkg"

  uninstall pkgutil: "com.apple.pkg.RealityConverter"

  zap trash: [
    "~/Library/Application Scripts/com.apple.RealityConverter",
    "~/Library/Caches/com.apple.helpd/Generated/com.apple.RealityConverter.help*1.0",
    "~/Library/Containers/com.apple.RealityConverter",
  ]
end
