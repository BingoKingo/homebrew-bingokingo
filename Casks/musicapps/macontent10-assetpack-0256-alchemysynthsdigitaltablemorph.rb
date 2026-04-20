cask "macontent10-assetpack-0256-alchemysynthsdigitaltablemorph" do
  version "fec46f5e7358b9d1816977b070f7ed32-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0256_AlchemySynthsDigitalTablemorph.pkg"
  name "MAContent10_AssetPack_0256_AlchemySynthsDigitalTablemorph"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0256_AlchemySynthsDigitalTablemorph.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0256_AlchemySynthsDigitalTablemorph.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0256_AlchemySynthsDigitalTablemorph"
end
