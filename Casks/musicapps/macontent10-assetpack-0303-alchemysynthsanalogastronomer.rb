cask "macontent10-assetpack-0303-alchemysynthsanalogastronomer" do
  version "1bd45fcd08e3ca3e1c30f33e5315b599-11"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0303_AlchemySynthsAnalogAstronomer.pkg"
  name "MAContent10_AssetPack_0303_AlchemySynthsAnalogAstronomer"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0303_AlchemySynthsAnalogAstronomer.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0303_AlchemySynthsAnalogAstronomer.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0303_AlchemySynthsAnalogAstronomer"
end
