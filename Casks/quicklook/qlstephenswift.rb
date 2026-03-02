cask "qlstephenswift" do
  version "20260206"
  sha256 "54025dcadc9d66936a4b8a5cea56c87b7144039ff2c64cb5e6b428bc3491d5eb"

  url "https://github.com/MyCometG3/QLStephenSwift/releases/download/#{version}/QLStephenSwift.#{version}.dmg"
  name "QLStephenSwift"
  desc "QuickLook extension for text files without extensions"
  homepage "https://github.com/MyCometG3/QLStephenSwift/"

  depends_on macos: ">=:sequoia"

  app "QLStephenSwift.app"

  zap trash: [
    "~/Library/Application Scripts/com.mycometg3.qlstephenswift",
    "~/Library/Application Scripts/com.mycometg3.qlstephenswift.qlstephenswiftpreview",
    "~/Library/Application Scripts/group.com.mycometg3.qlstephenswift",
    "~/Library/Containers/com.mycometg3.qlstephenswift",
    "~/Library/Containers/com.mycometg3.qlstephenswift.qlstephenswiftpreview",
    "~/Library/Group Containers/group.com.mycometg3.qlstephenswift",
  ]
end
