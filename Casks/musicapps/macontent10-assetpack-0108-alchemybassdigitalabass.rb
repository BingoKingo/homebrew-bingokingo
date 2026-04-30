cask "macontent10-assetpack-0108-alchemybassdigitalabass" do
  version "a41b159c08d5b02e3e9d3687a88ec770-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0108_AlchemyBassDigitalABass.pkg"
  name "MAContent10_AssetPack_0108_AlchemyBassDigitalABass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0108_AlchemyBassDigitalABass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0108_AlchemyBassDigitalABass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0108_AlchemyBassDigitalABass"
end
