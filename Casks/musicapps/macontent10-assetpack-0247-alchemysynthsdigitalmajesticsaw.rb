cask "macontent10-assetpack-0247-alchemysynthsdigitalmajesticsaw" do
  version "84c7956f6d54e7a1908dfc2803f2561d-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0247_AlchemySynthsDigitalMajesticSaw.pkg"
  name "MAContent10_AssetPack_0247_AlchemySynthsDigitalMajesticSaw"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0247_AlchemySynthsDigitalMajesticSaw.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0247_AlchemySynthsDigitalMajesticSaw.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0247_AlchemySynthsDigitalMajesticSaw"
end
