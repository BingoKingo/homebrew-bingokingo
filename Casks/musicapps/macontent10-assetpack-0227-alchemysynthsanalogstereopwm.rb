cask "macontent10-assetpack-0227-alchemysynthsanalogstereopwm" do
  version "648aed3897b63a9777e71667e979659d-15"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0227_AlchemySynthsAnalogStereoPWM.pkg"
  name "MAContent10_AssetPack_0227_AlchemySynthsAnalogStereoPWM"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0227_AlchemySynthsAnalogStereoPWM.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0227_AlchemySynthsAnalogStereoPWM.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0227_AlchemySynthsAnalogStereoPWM"
end
