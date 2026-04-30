cask "macontent10-assetpack-0551-appleloopsdubstep2" do
  version "3187f5b9fa8d6b691554017fd76bccbc-15"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0551_AppleLoopsDubstep2.pkg"
  name "MAContent10_AssetPack_0551_AppleLoopsDubstep2"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0551_AppleLoopsDubstep2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0551_AppleLoopsDubstep2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0551_AppleLoopsDubstep2"
end
