cask "macontent10-assetpack-0230-alchemysynthsanalogunisonsaw" do
  version "cb580b174d64adfad18c0bf74080c78a-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0230_AlchemySynthsAnalogUnisonSaw.pkg"
  name "MAContent10_AssetPack_0230_AlchemySynthsAnalogUnisonSaw"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0230_AlchemySynthsAnalogUnisonSaw.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0230_AlchemySynthsAnalogUnisonSaw.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0230_AlchemySynthsAnalogUnisonSaw"
end
