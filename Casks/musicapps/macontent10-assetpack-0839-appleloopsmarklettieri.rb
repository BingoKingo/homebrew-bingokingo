cask "macontent10-assetpack-0839-appleloopsmarklettieri" do
  version "f400efef4d39835b5e1d000603c82b44-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0839_AppleLoopsMarkLettieri.pkg"
  name "MAContent10_AssetPack_0839_AppleLoopsMarkLettieri"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0839_AppleLoopsMarkLettieri.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0839_AppleLoopsMarkLettieri.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0839_AppleLoopsMarkLettieri"
end
