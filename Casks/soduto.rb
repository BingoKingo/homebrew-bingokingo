cask "soduto" do
  version "2.0.3"
  sha256 "d0e7350b14e87253f93be36b6a04ee80831d8636b60a74fbf1d6ac0e455a6392"

  url "https://github.com/sannidhyaroy/Soduto/releases/download/v#{version}-nightly/Soduto.Nightly.dmg",
      verified: "github.com/sannidhyaroy/Soduto/"
  name "Soduto"
  desc "Communicate and share information between devices"
  homepage "https://soduto.thenoton.com/"

  depends_on arch: :arm64

  app "Soduto.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/Soduto.app"
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
      \033[1m[F]\033[0m Forked version, modified from
      https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/s/soduto.rb
    EOS
  end
end
