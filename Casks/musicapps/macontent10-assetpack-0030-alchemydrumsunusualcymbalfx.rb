cask "macontent10-assetpack-0030-alchemydrumsunusualcymbalfx" do
  version "22513af8d85d1bdb4a2a3420479ad12e-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0030_AlchemyDrumsUnusualCymbalFX.pkg"
  name "MAContent10_AssetPack_0030_AlchemyDrumsUnusualCymbalFX"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0030_AlchemyDrumsUnusualCymbalFX.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0030_AlchemyDrumsUnusualCymbalFX.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0030_AlchemyDrumsUnusualCymbalFX"
end
