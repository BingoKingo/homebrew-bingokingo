cask "macontent10-assetpack-0106-alchemybassmini" do
  version "bb8e179ec7854abc12064b61574cf887"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0106_AlchemyBassMini.pkg"
  name "MAContent10_AssetPack_0106_AlchemyBassMini"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0106_AlchemyBassMini.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0106_AlchemyBassMini.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0106_AlchemyBassMini"
end
