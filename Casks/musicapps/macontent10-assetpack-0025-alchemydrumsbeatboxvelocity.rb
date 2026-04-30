cask "macontent10-assetpack-0025-alchemydrumsbeatboxvelocity" do
  version "63f849e3c79b1760611447f9f0d0d8cd-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0025_AlchemyDrumsBeatBoxVelocity.pkg"
  name "MAContent10_AssetPack_0025_AlchemyDrumsBeatBoxVelocity"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0025_AlchemyDrumsBeatBoxVelocity.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0025_AlchemyDrumsBeatBoxVelocity.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0025_AlchemyDrumsBeatBoxVelocity"
end
