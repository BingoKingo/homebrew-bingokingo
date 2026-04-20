cask "macontent10-assetpack-0301-alchemydrumselectronicalchemy" do
  version "debcb71d28b978a01e65c5b38e912187"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0301_AlchemyDrumsElectronicAlchemy.pkg"
  name "MAContent10_AssetPack_0301_AlchemyDrumsElectronicAlchemy"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0301_AlchemyDrumsElectronicAlchemy.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0301_AlchemyDrumsElectronicAlchemy.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0301_AlchemyDrumsElectronicAlchemy"
end
