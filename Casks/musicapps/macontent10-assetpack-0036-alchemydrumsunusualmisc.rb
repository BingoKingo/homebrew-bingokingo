cask "macontent10-assetpack-0036-alchemydrumsunusualmisc" do
  version "f15f42d74b181484811889bef2ec49d9-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0036_AlchemyDrumsUnusualMisc.pkg"
  name "MAContent10_AssetPack_0036_AlchemyDrumsUnusualMisc"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0036_AlchemyDrumsUnusualMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0036_AlchemyDrumsUnusualMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0036_AlchemyDrumsUnusualMisc"
end
