cask "hrsword" do
  version :latest
  sha256 :no_check

  url "https://web.archive.org/web/20231122083116/https://down5.huorong.cn/Mac/HRSword_Installer.dmg",
      verified: "web.archive.org/"
  # url "https://down5.huorong.cn/Mac/HRSword_Installer.dmg"
  name "HRSword"
  desc "火绒安全软件-火绒剑"
  homepage "https://www.huorong.cn/"

  deprecate! date: "2024-11-22", because: :discontinued

  depends_on macos: ">= :big_sur"

  app "HRSWord.app"

  zap trash: "~/Library/Preferences/cn.huorong.HRSword.plist"

  caveats do
    <<~EOS
      [A] Archived version captured by Wayback Machine.
    EOS
  end
end
