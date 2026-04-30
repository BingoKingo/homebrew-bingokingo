cask "macontent10-assetpack-0534-drummerstudio" do
  version "7d5e196c88670877a8eb7d49b9353f75-115"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0534_DrummerStudio.pkg"
  name "MAContent10_AssetPack_0534_DrummerStudio"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0534_DrummerStudio.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0534_DrummerStudio.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0534_DrummerStudio"
end
