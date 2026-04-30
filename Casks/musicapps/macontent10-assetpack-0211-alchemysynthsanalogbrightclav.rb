cask "macontent10-assetpack-0211-alchemysynthsanalogbrightclav" do
  version "09b085067cb81bf6d159baadbc782d9f-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0211_AlchemySynthsAnalogBrightClav.pkg"
  name "MAContent10_AssetPack_0211_AlchemySynthsAnalogBrightClav"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0211_AlchemySynthsAnalogBrightClav.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0211_AlchemySynthsAnalogBrightClav.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0211_AlchemySynthsAnalogBrightClav"
end
