cask "macontent10-assetpack-0002-alchemyorgans" do
  version "8ef6202d8ac1a36722ffcedc9f87a58d-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0002_AlchemyOrgans.pkg"
  name "MAContent10_AssetPack_0002_AlchemyOrgans"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0002_AlchemyOrgans.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0002_AlchemyOrgans.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0002_AlchemyOrgans"
end
