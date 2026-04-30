cask "macontent10-assetpack-0892-demosonglogicspatialaudiodemo" do
  version "b0fcdf6864a024fbbfcf4f9f18f7faae-36"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0892_DemosongLogicSpatialAudioDemo.pkg"
  name "MAContent10_AssetPack_0892_DemosongLogicSpatialAudioDemo"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0892_DemosongLogicSpatialAudioDemo.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0892_DemosongLogicSpatialAudioDemo.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0892_DemosongLogicSpatialAudioDemo"
end
