cask "macontent10-assetpack-0972-drummerbluebird-v2" do
  version "1cd1f009c04fd1c7b7c33be77513ba6d-20"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0972_DrummerBluebird_V2.pkg"
  name "MAContent10_AssetPack_0972_DrummerBluebird_V2"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0972_DrummerBluebird_V2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0972_DrummerBluebird_V2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0972_DrummerBluebird_V2"
end
