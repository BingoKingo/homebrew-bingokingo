cask "macontent10-assetpack-0221-alchemysynthsanaloghugesquare" do
  version "db485264f4e9bee5d451070b1c48f348-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0221_AlchemySynthsAnalogHugeSquare.pkg"
  name "MAContent10_AssetPack_0221_AlchemySynthsAnalogHugeSquare"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0221_AlchemySynthsAnalogHugeSquare.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0221_AlchemySynthsAnalogHugeSquare.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0221_AlchemySynthsAnalogHugeSquare"
end
