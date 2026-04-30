cask "macontent10-assetpack-0208-alchemysynthsanalogpulse" do
  version "06e9da8492b15c1a072fe90d69888c0d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0208_AlchemySynthsAnalogPulse.pkg"
  name "MAContent10_AssetPack_0208_AlchemySynthsAnalogPulse"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0208_AlchemySynthsAnalogPulse.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0208_AlchemySynthsAnalogPulse.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0208_AlchemySynthsAnalogPulse"
end
