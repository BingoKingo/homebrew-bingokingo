# [O] Archived.
cask "hrsword" do
  version :latest
  sha256 :no_check

  url "https://web.archive.org/web/20231122083116/https://down5.huorong.cn/Mac/HRSword_Installer.dmg"
  name "HRSword"
  desc "火绒安全软件-火绒剑"
  homepage "https://www.huorong.cn/"

  depends_on macos: ">= :big_sur"

  app "HRSWord.app"

  zap trash: "~/Library/Preferences/cn.huorong.HRSword.plist"
end
