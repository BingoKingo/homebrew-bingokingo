cask "macontent10-assetpack-0564-drummerbrooklynlogic" do
  version "41ec11e2ea553cfb5bdf86a5e1ad0319-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0564_DrummerBrooklynLogic.pkg"
  name "MAContent10_AssetPack_0564_DrummerBrooklynLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0564_DrummerBrooklynLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0564_DrummerBrooklynLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0564_DrummerBrooklynLogic"
end
