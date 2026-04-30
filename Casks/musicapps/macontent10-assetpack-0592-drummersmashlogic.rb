cask "macontent10-assetpack-0592-drummersmashlogic" do
  version "5970db3f5bf8fb44e2323df92d6cd47c-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0592_DrummerSmashLogic.pkg"
  name "MAContent10_AssetPack_0592_DrummerSmashLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0592_DrummerSmashLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0592_DrummerSmashLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0592_DrummerSmashLogic"
end
