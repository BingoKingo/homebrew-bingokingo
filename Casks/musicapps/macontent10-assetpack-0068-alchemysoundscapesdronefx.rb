cask "macontent10-assetpack-0068-alchemysoundscapesdronefx" do
  version "eba98ab4938a58e8b663953fbc402553-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0068_AlchemySoundscapesDroneFX.pkg"
  name "MAContent10_AssetPack_0068_AlchemySoundscapesDroneFX"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0068_AlchemySoundscapesDroneFX.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0068_AlchemySoundscapesDroneFX.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0068_AlchemySoundscapesDroneFX"
end
