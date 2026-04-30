cask "macontent10-assetpack-0116-alchemybassdigitalmisc" do
  version "0b8a3d562bc78e98a4681ae66c4fb8d4-9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0116_AlchemyBassDigitalMisc.pkg"
  name "MAContent10_AssetPack_0116_AlchemyBassDigitalMisc"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0116_AlchemyBassDigitalMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0116_AlchemyBassDigitalMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0116_AlchemyBassDigitalMisc"
end
