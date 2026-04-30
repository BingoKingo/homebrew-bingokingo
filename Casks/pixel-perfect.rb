cask "pixel-perfect" do
  version "1.5"
  sha256 "94c2fbb35850b3703e1677959421c761b4ad9860a8d17f383c07900fbd89c99a"

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
                     "-dr", "com.apple.quarantine", "#{appdir}/Pixel Perfect.app"
                   ]
  end

  zap trash: [
    "~/Library/Caches/com.mac.PixelPerfect",
    "~/Library/HTTPStorages/com.mac.PixelPerfect",
    "~/Library/Preferences/com.mac.PixelPerfect.plist",
  ]

  caveats do
    <<~EOS
      [R] No notarization and inestimable ad-hoc signature,
      more details from https://github.com/Homebrew/homebrew-cask/pull/152173
    EOS
  end
end
