cask "macontent10-assetpack-0091-alchemybassmini3vcosaws" do
  version "1d94716cc4e63f7f1779f3e16d7806fc-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0091_AlchemyBassMini3VCOSaws.pkg"
  name "MAContent10_AssetPack_0091_AlchemyBassMini3VCOSaws"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0091_AlchemyBassMini3VCOSaws.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0091_AlchemyBassMini3VCOSaws.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0091_AlchemyBassMini3VCOSaws"
end
