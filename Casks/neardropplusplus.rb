cask "neardropplusplus" do
  version "2.0.6"
  sha256 "19baa3abf35ed6fe88594cdf665ccf393058357be08f38bd484146db0edcbabd"

  url "https://github.com/JiachengHou-PnR/NearDropPlusPlus/releases/download/#{version}/NearDropPlusPlus.app.zip"
  name "NearDropPlusPlus"
  desc "Unofficial Google Nearby Share app (Advanced version)"
  homepage "https://github.com/JiachengHou-PnR/NearDropPlusPlus/"

  depends_on macos: ">= :big_sur"

  app "NearDropPlusPlus.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/NearDropPlusPlus.app"
                   ]
  end

  uninstall quit: "me.jiahou.NearDropPlusPlus"

  zap trash: [
    "~/Library/Application Scripts/me.jiahou.NearDropPlusPlus",
    "~/Library/Application Scripts/me.jiahou.NearDropPlusPlus.ShareExtension",
    "~/Library/Containers/me.jiahou.NearDropPlusPlus",
    "~/Library/Containers/me.jiahou.NearDropPlusPlus.ShareExtension",
  ]

  caveats do
    <<~EOS
      [F] Forked version of https://github.com/grishka/NearDrop
    EOS
  end
end
