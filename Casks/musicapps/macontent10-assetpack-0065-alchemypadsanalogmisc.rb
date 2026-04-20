cask "macontent10-assetpack-0065-alchemypadsanalogmisc" do
  version "2e040b5360ebc82a7ac338a0b5b045dc-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0065_AlchemyPadsAnalogMisc.pkg"
  name "MAContent10_AssetPack_0065_AlchemyPadsAnalogMisc"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0065_AlchemyPadsAnalogMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0065_AlchemyPadsAnalogMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0065_AlchemyPadsAnalogMisc"
end
