cask "pixel-perfect" do
  version "1.4"
  sha256 "31b98c0d3afc71df6e4ea99be82c89d3d910ca7dbb2c6d553254e4ac86f25ece"

  url "https://github.com/cormiertyshawn895/PixelPerfect/releases/download/#{version}/PixelPerfect.#{version}.zip"
  name "Pixel Perfect"
  desc "Increase text size and render at native resolution of iOS apps"
  homepage "https://github.com/cormiertyshawn895/PixelPerfect/"

  auto_updates true
  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "Pixel Perfect/Pixel Perfect.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/Pixel Perfect.app"
                   ]
  end

  zap trash: [
    "~/Library/Caches/com.mac.PixelPerfect",
    "~/Library/HTTPStorages/com.mac.PixelPerfect",
    "~/Library/Preferences/com.mac.PixelPerfect.plist",
  ]

  caveats do
    <<~EOS
      \033[1m[R]\033[0m No notarization and inestimable ad-hoc signature,
      more details from https://github.com/Homebrew/homebrew-cask/pull/152173
    EOS
  end
end
