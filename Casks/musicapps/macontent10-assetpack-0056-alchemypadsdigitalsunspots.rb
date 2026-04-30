cask "macontent10-assetpack-0056-alchemypadsdigitalsunspots" do
  version "0ca48a3af9439f550619bec194369daa-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0056_AlchemyPadsDigitalSunspots.pkg"
  name "MAContent10_AssetPack_0056_AlchemyPadsDigitalSunspots"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0056_AlchemyPadsDigitalSunspots.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0056_AlchemyPadsDigitalSunspots.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0056_AlchemyPadsDigitalSunspots"
end
