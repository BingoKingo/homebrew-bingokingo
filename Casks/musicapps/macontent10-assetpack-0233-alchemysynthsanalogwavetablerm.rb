cask "macontent10-assetpack-0233-alchemysynthsanalogwavetablerm" do
  version "ecc68b53483294b35ce60bfbe4627b42-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0233_AlchemySynthsAnalogWavetableRM.pkg"
  name "MAContent10_AssetPack_0233_AlchemySynthsAnalogWavetableRM"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0233_AlchemySynthsAnalogWavetableRM.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0233_AlchemySynthsAnalogWavetableRM.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0233_AlchemySynthsAnalogWavetableRM"
end
