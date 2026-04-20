cask "macontent10-assetpack-0940-demosonglogicswing" do
  version "7bd628172adb42fb1ab6e92a6b078da3-53"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0940_DemosongLogicSwing.pkg"
  name "MAContent10_AssetPack_0940_DemosongLogicSwing"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0940_DemosongLogicSwing.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0940_DemosongLogicSwing.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0940_DemosongLogicSwing"
end
