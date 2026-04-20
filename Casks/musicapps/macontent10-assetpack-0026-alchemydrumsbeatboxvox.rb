cask "macontent10-assetpack-0026-alchemydrumsbeatboxvox" do
  version "3bf3e3a281cbde959e41c64199a6d876-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0026_AlchemyDrumsBeatBoxVox.pkg"
  name "MAContent10_AssetPack_0026_AlchemyDrumsBeatBoxVox"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0026_AlchemyDrumsBeatBoxVox.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0026_AlchemyDrumsBeatBoxVox.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0026_AlchemyDrumsBeatBoxVox"
end
