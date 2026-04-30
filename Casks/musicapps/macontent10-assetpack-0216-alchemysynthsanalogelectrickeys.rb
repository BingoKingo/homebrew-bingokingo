cask "macontent10-assetpack-0216-alchemysynthsanalogelectrickeys" do
  version "474c2a0ed9ead6b0d6abfbb5efc2e63c-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0216_AlchemySynthsAnalogElectricKeys.pkg"
  name "MAContent10_AssetPack_0216_AlchemySynthsAnalogElectricKeys"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0216_AlchemySynthsAnalogElectricKeys.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0216_AlchemySynthsAnalogElectricKeys.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0216_AlchemySynthsAnalogElectricKeys"
end
