cask "macontent10-assetpack-0023-alchemydrumsbeatboxprocessed" do
  version "4ae19fd94db7a4a20e5cddf49fef68ae-10"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0023_AlchemyDrumsBeatBoxProcessed.pkg"
  name "MAContent10_AssetPack_0023_AlchemyDrumsBeatBoxProcessed"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0023_AlchemyDrumsBeatBoxProcessed.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0023_AlchemyDrumsBeatBoxProcessed.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0023_AlchemyDrumsBeatBoxProcessed"
end
