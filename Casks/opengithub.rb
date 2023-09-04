cask "opengithub" do
  version "0.2.10"
  sha256 "b0e9b0ec40ed4db1b10d29193f8aa672d2f983819400de73d8b879758af76db8"

  url "https://github.com/Watson1978/OpenGithub/releases/download/v#{version}/OpenGithub.zip"
  name "OpenGithub"
  desc "Xcode extension to open the file on GitHub"
  homepage "https://github.com/Watson1978/OpenGithub/"

  depends_on macos: ">= :mojave"

  app "OpenGithub.app"

  zap trash: [
    "~/Library/Application Scripts/jp.cat-soft.OpenGithub",
    "~/Library/Application Scripts/jp.cat-soft.OpenGithub.OpenGithubExtension",
    "~/Library/Containers/jp.cat-soft.OpenGithub.OpenGithub",
    "~/Library/Containers/jp.cat-soft.OpenGithub.OpenGithubExtension",
    "~/Library/Preferences/jp.cat-soft.OpenGithub.OpenGithub.plist",
    "~/Library/Preferences/jp.cat-soft.OpenGithub.OpenGithubExtension.plist",
  ]
end
