cask "neardropplus" do
  version "1.2.2"
  sha256 "e6d4b84958d04a79c6f4375c1b25b58a60ba9066c35e265ca423560fcfaad525"

  url "https://github.com/XRayAdamo/NearDrop/releases/download/#{version}/NearDropPlus.zip"
  name "NearDropPlus"
  desc "Unofficial Google Nearby Share app (Advanced version)"
  homepage "https://github.com/XRayAdamo/NearDrop/"

  deprecate! date: "2023-07-19", because: :unmaintained

  depends_on macos: ">= :big_sur"

  app "NearDropPlus.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/NearDropPlus.app"
                   ]
  end

  uninstall quit: "com.rayadams.neardropadv"

  zap trash: [
    "~/Library/Application Scripts/com.rayadams.neardropadv",
    "~/Library/Containers/com.rayadams.neardropadv",
  ]

  caveats do
    <<~EOS
      \033[1m[F]\033[0m Forked version of https://github.com/grishka/NearDrop
    EOS
  end
end
