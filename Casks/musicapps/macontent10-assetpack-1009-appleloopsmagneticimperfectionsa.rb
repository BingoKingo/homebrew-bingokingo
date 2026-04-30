cask "macontent10-assetpack-1009-appleloopsmagneticimperfectionsa" do
  version "58b1e9d7f6269f636f0e52ab625ebbd2-27"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1009_AppleLoopsMagneticImperfectionsA.pkg"
  name "MAContent10_AssetPack_1009_AppleLoopsMagneticImperfectionsA"
  desc "ContainsAppleLoops, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1009_AppleLoopsMagneticImperfectionsA.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1009_AppleLoopsMagneticImperfectionsA.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1009_AppleLoopsMagneticImperfectionsA"
end
