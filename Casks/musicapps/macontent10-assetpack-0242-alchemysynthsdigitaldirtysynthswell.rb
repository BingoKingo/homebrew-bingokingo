cask "macontent10-assetpack-0242-alchemysynthsdigitaldirtysynthswell" do
  version "904026e3a95cce57f4c32cb6c68c9e2f-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0242_AlchemySynthsDigitalDirtySynthSwell.pkg"
  name "MAContent10_AssetPack_0242_AlchemySynthsDigitalDirtySynthSwell"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0242_AlchemySynthsDigitalDirtySynthSwell.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0242_AlchemySynthsDigitalDirtySynthSwell.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0242_AlchemySynthsDigitalDirtySynthSwell"
end
