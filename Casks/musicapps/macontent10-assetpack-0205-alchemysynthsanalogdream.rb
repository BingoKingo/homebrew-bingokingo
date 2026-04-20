cask "macontent10-assetpack-0205-alchemysynthsanalogdream" do
  version "49fa9cd3e4e2f763a8a33aa254606acd-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0205_AlchemySynthsAnalogDream.pkg"
  name "MAContent10_AssetPack_0205_AlchemySynthsAnalogDream"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0205_AlchemySynthsAnalogDream.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0205_AlchemySynthsAnalogDream.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0205_AlchemySynthsAnalogDream"
end
