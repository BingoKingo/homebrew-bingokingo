cask "macontent10-assetpack-0097-alchemybassanalogtechno" do
  version "e0aebbdbc657109c73411f698b0db8f7-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0097_AlchemyBassAnalogTechno.pkg"
  name "MAContent10_AssetPack_0097_AlchemyBassAnalogTechno"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0097_AlchemyBassAnalogTechno.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0097_AlchemyBassAnalogTechno.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0097_AlchemyBassAnalogTechno"
end
