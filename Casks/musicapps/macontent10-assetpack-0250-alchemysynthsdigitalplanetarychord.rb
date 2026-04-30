cask "macontent10-assetpack-0250-alchemysynthsdigitalplanetarychord" do
  version "06db9dc3625ad4ea299442d583cea7e4-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0250_AlchemySynthsDigitalPlanetaryChord.pkg"
  name "MAContent10_AssetPack_0250_AlchemySynthsDigitalPlanetaryChord"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0250_AlchemySynthsDigitalPlanetaryChord.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0250_AlchemySynthsDigitalPlanetaryChord.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0250_AlchemySynthsDigitalPlanetaryChord"
end
