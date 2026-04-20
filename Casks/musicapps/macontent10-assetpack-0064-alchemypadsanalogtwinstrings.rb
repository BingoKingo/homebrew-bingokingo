cask "macontent10-assetpack-0064-alchemypadsanalogtwinstrings" do
  version "3a9a60568f5ed31eb9624a507a0bfc5e-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0064_AlchemyPadsAnalogTwinStrings.pkg"
  name "MAContent10_AssetPack_0064_AlchemyPadsAnalogTwinStrings"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0064_AlchemyPadsAnalogTwinStrings.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0064_AlchemyPadsAnalogTwinStrings.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0064_AlchemyPadsAnalogTwinStrings"
end
