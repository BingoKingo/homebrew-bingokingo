cask "macontent10-assetpack-0024-alchemydrumsbeatboxrr" do
  version "09c52684380f4b40528eac8c2ddfc0df"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0024_AlchemyDrumsBeatBoxRR.pkg"
  name "MAContent10_AssetPack_0024_AlchemyDrumsBeatBoxRR"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0024_AlchemyDrumsBeatBoxRR.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0024_AlchemyDrumsBeatBoxRR.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0024_AlchemyDrumsBeatBoxRR"
end
