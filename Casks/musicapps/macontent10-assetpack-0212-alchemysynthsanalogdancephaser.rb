cask "macontent10-assetpack-0212-alchemysynthsanalogdancephaser" do
  version "2de1bdb9c5d64140666862fe18a78815-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0212_AlchemySynthsAnalogDancePhaser.pkg"
  name "MAContent10_AssetPack_0212_AlchemySynthsAnalogDancePhaser"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0212_AlchemySynthsAnalogDancePhaser.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0212_AlchemySynthsAnalogDancePhaser.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0212_AlchemySynthsAnalogDancePhaser"
end
