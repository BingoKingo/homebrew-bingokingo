cask "macontent10-assetpack-0257-alchemysynthsdigitalmisc" do
  version "a054d30ff5ca63e664612ddb4da2963b-11"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0257_AlchemySynthsDigitalMisc.pkg"
  name "MAContent10_AssetPack_0257_AlchemySynthsDigitalMisc"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0257_AlchemySynthsDigitalMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0257_AlchemySynthsDigitalMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0257_AlchemySynthsDigitalMisc"
end
