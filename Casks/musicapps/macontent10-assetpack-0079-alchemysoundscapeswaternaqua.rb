cask "macontent10-assetpack-0079-alchemysoundscapeswaternaqua" do
  version "94e51dbb0a7f24808a7375659bd54d9d-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0079_AlchemySoundscapesWaterNAqua.pkg"
  name "MAContent10_AssetPack_0079_AlchemySoundscapesWaterNAqua"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0079_AlchemySoundscapesWaterNAqua.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0079_AlchemySoundscapesWaterNAqua.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0079_AlchemySoundscapesWaterNAqua"
end
