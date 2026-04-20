cask "macontent10-assetpack-0657-alchemypadscustom" do
  version "af71ce0c9f8cb58765e7a1e8d8b4115b-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0657_AlchemyPadsCustom.pkg"
  name "MAContent10_AssetPack_0657_AlchemyPadsCustom"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0657_AlchemyPadsCustom.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0657_AlchemyPadsCustom.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0657_AlchemyPadsCustom"
end
