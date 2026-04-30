cask "macontent10-assetpack-0133-alchemyguitarspluckededo" do
  version "7e01a591f07e56c914547756b5a16a3c-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0133_AlchemyGuitarsPluckedEdo.pkg"
  name "MAContent10_AssetPack_0133_AlchemyGuitarsPluckedEdo"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0133_AlchemyGuitarsPluckedEdo.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0133_AlchemyGuitarsPluckedEdo.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0133_AlchemyGuitarsPluckedEdo"
end
