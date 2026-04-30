cask "macontent10-assetpack-0033-alchemydrumsunusualcavedrum" do
  version "e551ba1ffd30992e400f9b4c54759fed-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0033_AlchemyDrumsUnusualCaveDrum.pkg"
  name "MAContent10_AssetPack_0033_AlchemyDrumsUnusualCaveDrum"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0033_AlchemyDrumsUnusualCaveDrum.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0033_AlchemyDrumsUnusualCaveDrum.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0033_AlchemyDrumsUnusualCaveDrum"
end
