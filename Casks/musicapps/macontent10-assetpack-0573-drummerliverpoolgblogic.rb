cask "macontent10-assetpack-0573-drummerliverpoolgblogic" do
  version "8c75cfe04c59d30a0c6ec9bb15d5533c-32"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0573_DrummerLiverpoolGBLogic.pkg"
  name "MAContent10_AssetPack_0573_DrummerLiverpoolGBLogic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0573_DrummerLiverpoolGBLogic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0573_DrummerLiverpoolGBLogic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0573_DrummerLiverpoolGBLogic"
end
