cask "macontent10-assetpack-0028-alchemydrumsunusualicefx" do
  version "0dd00d627a0baf345e73e6b67f375656-9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0028_AlchemyDrumsUnusualIceFX.pkg"
  name "MAContent10_AssetPack_0028_AlchemyDrumsUnusualIceFX"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0028_AlchemyDrumsUnusualIceFX.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0028_AlchemyDrumsUnusualIceFX.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0028_AlchemyDrumsUnusualIceFX"
end
