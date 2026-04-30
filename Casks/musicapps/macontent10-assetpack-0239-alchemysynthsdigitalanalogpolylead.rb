cask "macontent10-assetpack-0239-alchemysynthsdigitalanalogpolylead" do
  version "24762540a5588cd88560fbbfcebac1ba-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0239_AlchemySynthsDigitalAnalogPolyLead.pkg"
  name "MAContent10_AssetPack_0239_AlchemySynthsDigitalAnalogPolyLead"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0239_AlchemySynthsDigitalAnalogPolyLead.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0239_AlchemySynthsDigitalAnalogPolyLead.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0239_AlchemySynthsDigitalAnalogPolyLead"
end
