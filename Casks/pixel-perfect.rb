# [R] No notarization and inestimable ad-hoc signature, more details from https://github.com/Homebrew/homebrew-cask/pull/152173
cask "pixel-perfect" do
  version "1.3"
  sha256 "e17435cc750be22a55ba8dcb2e6b0bc51117be03793bbac0bd91a2fe7685533b"

  url "https://github.com/cormiertyshawn895/PixelPerfect/releases/download/#{version}/PixelPerfect.#{version}.zip"
  name "Pixel Perfect"
  desc "Increase text size and render at native resolution of iOS apps"
  homepage "https://github.com/cormiertyshawn895/PixelPerfect/"

  auto_updates true
  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "Pixel Perfect/Pixel Perfect.app"

  zap trash: [
    "~/Library/Caches/com.mac.PixelPerfect",
    "~/Library/HTTPStorages/com.mac.PixelPerfect",
    "~/Library/Preferences/com.mac.PixelPerfect.plist",
  ]
end
