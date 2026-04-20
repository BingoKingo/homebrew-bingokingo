cask "macontent10-assetpack-0535-drummertightmaple" do
  version "cfda4df8ecaa18d76af02fc712da2329-141"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0535_DrummerTightMaple.pkg"
  name "MAContent10_AssetPack_0535_DrummerTightMaple"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0535_DrummerTightMaple.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0535_DrummerTightMaple.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0535_DrummerTightMaple"
end
