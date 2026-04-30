cask "macontent10-assetpack-0228-alchemysynthsanalogsync" do
  version "c707b9d78254f2f4d419f42bd19cf6b7-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0228_AlchemySynthsAnalogSync.pkg"
  name "MAContent10_AssetPack_0228_AlchemySynthsAnalogSync"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0228_AlchemySynthsAnalogSync.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0228_AlchemySynthsAnalogSync.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0228_AlchemySynthsAnalogSync"
end
