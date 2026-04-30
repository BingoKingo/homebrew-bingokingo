cask "macontent10-assetpack-0514-drummerpawnshop" do
  version "d82d90c8498917217bab328dc4d12665-120"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0514_DrummerPawnShop.pkg"
  name "MAContent10_AssetPack_0514_DrummerPawnShop"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0514_DrummerPawnShop.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0514_DrummerPawnShop.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0514_DrummerPawnShop"
end
