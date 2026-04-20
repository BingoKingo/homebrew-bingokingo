cask "macontent10-assetpack-0957-studiobassclassicaddition" do
  version "1277f0a7e8b2a775ad7c5a64e3077fbe-58"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0957_StudioBassClassicAddition.pkg"
  name "MAContent10_AssetPack_0957_StudioBassClassicAddition"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0957_StudioBassClassicAddition.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0957_StudioBassClassicAddition.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0957_StudioBassClassicAddition"
end
