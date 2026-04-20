cask "macontent10-assetpack-0244-alchemysynthsdigitalformy" do
  version "c6f32f278de1a1b48f06f0fb55938488-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0244_AlchemySynthsDigitalFormy.pkg"
  name "MAContent10_AssetPack_0244_AlchemySynthsDigitalFormy"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0244_AlchemySynthsDigitalFormy.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0244_AlchemySynthsDigitalFormy.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0244_AlchemySynthsDigitalFormy"
end
