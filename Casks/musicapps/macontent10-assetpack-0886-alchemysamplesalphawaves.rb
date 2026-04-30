cask "macontent10-assetpack-0886-alchemysamplesalphawaves" do
  version "b86549e6c7a3ed239b9c9c07e5a4c7a2-10"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0886_AlchemySamplesAlphaWaves.pkg"
  name "MAContent10_AssetPack_0886_AlchemySamplesAlphaWaves"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0886_AlchemySamplesAlphaWaves.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0886_AlchemySamplesAlphaWaves.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0886_AlchemySamplesAlphaWaves"
end
