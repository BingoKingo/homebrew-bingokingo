cask "macontent10-assetpack-0240-alchemysynthsdigitalbrokendreams" do
  version "270c01fa2b0e2a776750ca3ef7fb0308"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0240_AlchemySynthsDigitalBrokenDreams.pkg"
  name "MAContent10_AssetPack_0240_AlchemySynthsDigitalBrokenDreams"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0240_AlchemySynthsDigitalBrokenDreams.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0240_AlchemySynthsDigitalBrokenDreams.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0240_AlchemySynthsDigitalBrokenDreams"
end
