cask "macontent10-assetpack-0217-alchemysynthsanalogfatstrings" do
  version "64427d3cad9d5e7d489a17c18711b602-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0217_AlchemySynthsAnalogFatStrings.pkg"
  name "MAContent10_AssetPack_0217_AlchemySynthsAnalogFatStrings"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0217_AlchemySynthsAnalogFatStrings.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0217_AlchemySynthsAnalogFatStrings.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0217_AlchemySynthsAnalogFatStrings"
end
