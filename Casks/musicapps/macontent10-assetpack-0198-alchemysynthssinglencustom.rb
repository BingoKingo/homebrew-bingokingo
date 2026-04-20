cask "macontent10-assetpack-0198-alchemysynthssinglencustom" do
  version "3e6e7e0d008b016b0bd6eecad4855a7c-17"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0198_AlchemySynthsSingleNCustom.pkg"
  name "MAContent10_AssetPack_0198_AlchemySynthsSingleNCustom"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0198_AlchemySynthsSingleNCustom.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0198_AlchemySynthsSingleNCustom.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0198_AlchemySynthsSingleNCustom"
end
