cask "macontent10-assetpack-0218-alchemysynthsanalogfilterdirtlead" do
  version "ab7bc4033cfd6e3d5b38c6bd5b168892-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0218_AlchemySynthsAnalogFilterDirtLead.pkg"
  name "MAContent10_AssetPack_0218_AlchemySynthsAnalogFilterDirtLead"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0218_AlchemySynthsAnalogFilterDirtLead.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0218_AlchemySynthsAnalogFilterDirtLead.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0218_AlchemySynthsAnalogFilterDirtLead"
end
