cask "macontent10-assetpack-0099-alchemybassanaloganalogringmod" do
  version "a4844a58d59871de38b0b1c723c7de36-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0099_AlchemyBassAnalogAnalogRingMod.pkg"
  name "MAContent10_AssetPack_0099_AlchemyBassAnalogAnalogRingMod"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0099_AlchemyBassAnalogAnalogRingMod.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0099_AlchemyBassAnalogAnalogRingMod.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0099_AlchemyBassAnalogAnalogRingMod"
end
