cask "macontent10-assetpack-0324-appleloopsbluesgarage" do
  version "d00755bfccdba4dc55ad56891809f2cb-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0324_AppleLoopsBluesGarage.pkg"
  name "MAContent10_AssetPack_0324_AppleLoopsBluesGarage"
  desc "ContainsAppleLoops, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0324_AppleLoopsBluesGarage.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0324_AppleLoopsBluesGarage.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0324_AppleLoopsBluesGarage"
end
