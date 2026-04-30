cask "macontent10-assetpack-0255-alchemysynthsdigitalsculptstruck" do
  version "565be3fa8ed3f2623c559c8971c0b43a-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0255_AlchemySynthsDigitalSculptStruck.pkg"
  name "MAContent10_AssetPack_0255_AlchemySynthsDigitalSculptStruck"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0255_AlchemySynthsDigitalSculptStruck.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0255_AlchemySynthsDigitalSculptStruck.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0255_AlchemySynthsDigitalSculptStruck"
end
