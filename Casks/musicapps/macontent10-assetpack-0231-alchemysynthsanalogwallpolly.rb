cask "macontent10-assetpack-0231-alchemysynthsanalogwallpolly" do
  version "78bc40d0fee865a1465286470f55ca63"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0231_AlchemySynthsAnalogWallPolly.pkg"
  name "MAContent10_AssetPack_0231_AlchemySynthsAnalogWallPolly"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0231_AlchemySynthsAnalogWallPolly.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0231_AlchemySynthsAnalogWallPolly.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0231_AlchemySynthsAnalogWallPolly"
end
