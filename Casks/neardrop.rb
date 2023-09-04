# [R] No notarization and inestimable ad-hoc signature, more details from https://github.com/Homebrew/homebrew-cask/pull/145241
cask "neardrop" do
  version "1.1.1"
  sha256 "af03242ab504a48cfa310ba1ad5b6f98c9501d3a48acea5c9bf7ba62ac7257e1"

  url "https://github.com/grishka/NearDrop/releases/download/v#{version}/NearDrop.app.zip"
  name "NearDrop"
  desc "Unofficial Google Nearby Share app"
  homepage "https://github.com/grishka/NearDrop/"

  depends_on macos: ">= :big_sur"

  app "NearDrop.app"

  uninstall quit: "me.grishka.NearDrop"

  zap trash: [
    "~/Library/Application Scripts/me.grishka.NearDrop",
    "~/Library/Containers/me.grishka.NearDrop",
  ]
end
