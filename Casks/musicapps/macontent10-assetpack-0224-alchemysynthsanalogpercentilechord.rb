cask "macontent10-assetpack-0224-alchemysynthsanalogpercentilechord" do
  version "07894c64b5442814d3f06f61a5092dff-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0224_AlchemySynthsAnalogPercentileChord.pkg"
  name "MAContent10_AssetPack_0224_AlchemySynthsAnalogPercentileChord"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0224_AlchemySynthsAnalogPercentileChord.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0224_AlchemySynthsAnalogPercentileChord.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0224_AlchemySynthsAnalogPercentileChord"
end
