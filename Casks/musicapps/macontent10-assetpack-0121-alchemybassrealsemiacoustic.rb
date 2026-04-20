cask "macontent10-assetpack-0121-alchemybassrealsemiacoustic" do
  version "47f3fbe51c0b6e5839c0a4bb0d1d28ca-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0121_AlchemyBassRealSemiAcoustic.pkg"
  name "MAContent10_AssetPack_0121_AlchemyBassRealSemiAcoustic"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0121_AlchemyBassRealSemiAcoustic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0121_AlchemyBassRealSemiAcoustic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0121_AlchemyBassRealSemiAcoustic"
end
