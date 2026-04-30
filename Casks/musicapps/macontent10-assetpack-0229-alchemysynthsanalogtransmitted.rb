cask "macontent10-assetpack-0229-alchemysynthsanalogtransmitted" do
  version "a37ff581ced10bd728b22a677a8ce476-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0229_AlchemySynthsAnalogTransmitted.pkg"
  name "MAContent10_AssetPack_0229_AlchemySynthsAnalogTransmitted"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0229_AlchemySynthsAnalogTransmitted.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0229_AlchemySynthsAnalogTransmitted.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0229_AlchemySynthsAnalogTransmitted"
end
