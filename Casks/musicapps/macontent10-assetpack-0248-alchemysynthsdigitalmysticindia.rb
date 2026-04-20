cask "macontent10-assetpack-0248-alchemysynthsdigitalmysticindia" do
  version "5c209b4427446fb16a3255fb67519fb6-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0248_AlchemySynthsDigitalMysticIndia.pkg"
  name "MAContent10_AssetPack_0248_AlchemySynthsDigitalMysticIndia"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0248_AlchemySynthsDigitalMysticIndia.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0248_AlchemySynthsDigitalMysticIndia.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0248_AlchemySynthsDigitalMysticIndia"
end
