cask "macontent10-assetpack-0004-alchemywoodwinds" do
  version "568832178de4ac7ab4c0c0ae4f99a0bb-14"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0004_AlchemyWoodwinds.pkg"
  name "MAContent10_AssetPack_0004_AlchemyWoodwinds"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0004_AlchemyWoodwinds.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0004_AlchemyWoodwinds.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0004_AlchemyWoodwinds"
end
