cask "macontent10-assetpack-0029-alchemydrumsunusualdeep" do
  version "9b35497fe268fd9beb59174deff42c79-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0029_AlchemyDrumsUnusualDeep.pkg"
  name "MAContent10_AssetPack_0029_AlchemyDrumsUnusualDeep"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0029_AlchemyDrumsUnusualDeep.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0029_AlchemyDrumsUnusualDeep.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0029_AlchemyDrumsUnusualDeep"
end
