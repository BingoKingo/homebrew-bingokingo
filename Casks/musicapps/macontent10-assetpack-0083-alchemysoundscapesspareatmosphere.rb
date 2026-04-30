cask "macontent10-assetpack-0083-alchemysoundscapesspareatmosphere" do
  version "21e855749adcffb5bdf17297ec9b4b92"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0083_AlchemySoundscapesSpareAtmosphere.pkg"
  name "MAContent10_AssetPack_0083_AlchemySoundscapesSpareAtmosphere"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0083_AlchemySoundscapesSpareAtmosphere.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0083_AlchemySoundscapesSpareAtmosphere.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0083_AlchemySoundscapesSpareAtmosphere"
end
