cask "macontent10-assetpack-0538-drummersticks" do
  version "789f55c288ceab91daadfdd637cb99ea"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0538_DrummerSticks.pkg"
  name "MAContent10_AssetPack_0538_DrummerSticks"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0538_DrummerSticks.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0538_DrummerSticks.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0538_DrummerSticks"
end
