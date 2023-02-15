cask "hrsword" do
  version :latest
  sha256 :no_check

  url "https://down5.huorong.cn/Mac/HRSword_Installer.dmg"
  name "HRSword"
  desc "火绒安全软件-火绒剑"
  homepage "https://www.huorong.cn/"

  app "HRSWord.app"

  zap trash: [
    "~/Library/Preferences/cn.huorong.HRSword.plist",
  ]
end
