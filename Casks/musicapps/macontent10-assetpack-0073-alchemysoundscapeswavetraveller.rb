cask "macontent10-assetpack-0073-alchemysoundscapeswavetraveller" do
  version "68217eca2a48f7d7ed39a9b7605d4b7b-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0073_AlchemySoundscapesWaveTraveller.pkg"
  name "MAContent10_AssetPack_0073_AlchemySoundscapesWaveTraveller"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0073_AlchemySoundscapesWaveTraveller.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0073_AlchemySoundscapesWaveTraveller.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0073_AlchemySoundscapesWaveTraveller"
end
