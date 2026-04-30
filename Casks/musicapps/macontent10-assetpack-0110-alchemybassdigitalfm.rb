cask "macontent10-assetpack-0110-alchemybassdigitalfm" do
  version "93b1c9cd1c3a8474349921b8b7d54d54-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0110_AlchemyBassDigitalFM.pkg"
  name "MAContent10_AssetPack_0110_AlchemyBassDigitalFM"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0110_AlchemyBassDigitalFM.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0110_AlchemyBassDigitalFM.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0110_AlchemyBassDigitalFM"
end
