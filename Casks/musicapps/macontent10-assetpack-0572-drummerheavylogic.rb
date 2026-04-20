cask "macontent10-assetpack-0572-drummerheavylogic" do
  version "201ec3c48d56f40520140b48de9834d7-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0572_DrummerHeavyLogic.pkg"
  name "MAContent10_AssetPack_0572_DrummerHeavyLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0572_DrummerHeavyLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0572_DrummerHeavyLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0572_DrummerHeavyLogic"
end
