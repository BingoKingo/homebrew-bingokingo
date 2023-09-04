cask "neardropplus" do
  version "1.2.2"
  sha256 "e6d4b84958d04a79c6f4375c1b25b58a60ba9066c35e265ca423560fcfaad525"

  url "https://github.com/XRayAdamo/NearDrop/releases/download/#{version}/NearDropPlus.zip"
  name "NearDropPlus"
  desc "Unofficial Google Nearby Share app (Advanced version)"
  homepage "https://github.com/XRayAdamo/NearDrop/"

  app "NearDropPlus.app"

  uninstall quit: "com.rayadams.neardropadv"

  zap trash: [
    "~/Library/Application Scripts/com.rayadams.neardropadv",
    "~/Library/Containers/com.rayadams.neardropadv",
  ]
end
