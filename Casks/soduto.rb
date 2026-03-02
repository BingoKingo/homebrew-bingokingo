cask "soduto" do
  version "3.1.0"
  sha256 "24f8e6a90d75c38be5e72cb0058c256d084dc137de71c36e1226a9d92834d23a"

  url "https://github.com/sannidhyaroy/Soduto/releases/download/v#{version}-nightly/Soduto.Nightly.dmg",
      verified: "github.com/sannidhyaroy/Soduto/"
  name "Soduto"
  desc "Communicate and share information between devices"
  homepage "https://soduto.thenoton.com/"

  livecheck do
    url :url
    regex(/v?(\d+(?:\.\d+)+)-nightly/i)
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "Soduto.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-dr", "com.apple.quarantine", "#{appdir}/Soduto.app"
                   ]
  end

  zap trash: [
    "~/Library/Containers/com.soduto.Soduto",
    "~/Library/Containers/com.soduto.SodutoBrowser",
    "~/Library/Containers/com.soduto.SodutoLauncher",
    "~/Library/Saved Application State/com.soduto.SodutoBrowser.savedState",
  ]

  caveats do
    <<~EOS
      [F] Forked version, modified from
      https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/s/soduto.rb
    EOS
  end
end
