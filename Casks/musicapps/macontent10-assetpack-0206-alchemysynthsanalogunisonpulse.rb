cask "macontent10-assetpack-0206-alchemysynthsanalogunisonpulse" do
  version "e26009027bb4b9609b326667c410b881-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0206_AlchemySynthsAnalogUnisonPulse.pkg"
  name "MAContent10_AssetPack_0206_AlchemySynthsAnalogUnisonPulse"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0206_AlchemySynthsAnalogUnisonPulse.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0206_AlchemySynthsAnalogUnisonPulse.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0206_AlchemySynthsAnalogUnisonPulse"
end
