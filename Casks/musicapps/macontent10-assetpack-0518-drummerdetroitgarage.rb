cask "macontent10-assetpack-0518-drummerdetroitgarage" do
  version "cc6ec9822c0cf0d5b51826de7bd6a192-43"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0518_DrummerDetroitGarage.pkg"
  name "MAContent10_AssetPack_0518_DrummerDetroitGarage"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0518_DrummerDetroitGarage.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0518_DrummerDetroitGarage.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0518_DrummerDetroitGarage"
end
