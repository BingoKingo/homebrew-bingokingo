cask "macontent10-assetpack-0232-alchemysynthsanalogwaveshapedsines" do
  version "3fa0734bad92e0aa19223d0113672a0e-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0232_AlchemySynthsAnalogWaveshapedSines.pkg"
  name "MAContent10_AssetPack_0232_AlchemySynthsAnalogWaveshapedSines"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0232_AlchemySynthsAnalogWaveshapedSines.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0232_AlchemySynthsAnalogWaveshapedSines.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0232_AlchemySynthsAnalogWaveshapedSines"
end
