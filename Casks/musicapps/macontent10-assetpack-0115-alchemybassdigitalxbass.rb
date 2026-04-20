cask "macontent10-assetpack-0115-alchemybassdigitalxbass" do
  version "457a08ad012516d455d60d2360a3a729-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0115_AlchemyBassDigitalXBass.pkg"
  name "MAContent10_AssetPack_0115_AlchemyBassDigitalXBass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0115_AlchemyBassDigitalXBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0115_AlchemyBassDigitalXBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0115_AlchemyBassDigitalXBass"
end
