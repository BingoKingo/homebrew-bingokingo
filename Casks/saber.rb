cask "saber" do
  version "0.11.2"
  sha256 "7bec3f949d8e949bea08704ae3718fcca187169f5b15ed32a977ec061568f18d"

  url "https://github.com/adil192/saber/releases/download/v#{version}/Saber_v#{version}_#{version.minor}0#{version.patch}0.app.zip"
  name "Saber"
  desc "Cross-platform libre handwritten notes app"
  homepage "https://github.com/adil192/saber/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Saber.app"

  zap trash: [
    "~/Library/Containers/com.adilhanney.saber",
    "~/Library/Application Scripts/com.adilhanney.saber",
  ]
end
