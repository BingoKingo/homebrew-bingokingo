cask "macontent10-assetpack-0035-alchemydrumsunusuallightspacekit" do
  version "e6cad57ba16e825deb2d65df8fb174bc"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0035_AlchemyDrumsUnusualLightSpaceKit.pkg"
  name "MAContent10_AssetPack_0035_AlchemyDrumsUnusualLightSpaceKit"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0035_AlchemyDrumsUnusualLightSpaceKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0035_AlchemyDrumsUnusualLightSpaceKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0035_AlchemyDrumsUnusualLightSpaceKit"
end
