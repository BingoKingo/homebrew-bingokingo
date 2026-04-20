cask "macontent10-assetpack-0143-alchemyguitarspluckedpm" do
  version "3b3ec637176fdf7b03be7a5a89296c7d-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0143_AlchemyGuitarsPluckedPM.pkg"
  name "MAContent10_AssetPack_0143_AlchemyGuitarsPluckedPM"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0143_AlchemyGuitarsPluckedPM.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0143_AlchemyGuitarsPluckedPM.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0143_AlchemyGuitarsPluckedPM"
end
