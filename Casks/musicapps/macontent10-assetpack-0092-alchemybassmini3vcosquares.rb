cask "macontent10-assetpack-0092-alchemybassmini3vcosquares" do
  version "102d19b15d7956a0c478208ce8dad5ba-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0092_AlchemyBassMini3VCOSquares.pkg"
  name "MAContent10_AssetPack_0092_AlchemyBassMini3VCOSquares"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0092_AlchemyBassMini3VCOSquares.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0092_AlchemyBassMini3VCOSquares.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0092_AlchemyBassMini3VCOSquares"
end
