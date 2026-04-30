cask "macontent10-assetpack-0146-alchemyguitarspluckedfm" do
  version "ea1f306bf098f302e4eed66a0dba8b26"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0146_AlchemyGuitarsPluckedFM.pkg"
  name "MAContent10_AssetPack_0146_AlchemyGuitarsPluckedFM"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0146_AlchemyGuitarsPluckedFM.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0146_AlchemyGuitarsPluckedFM.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0146_AlchemyGuitarsPluckedFM"
end
