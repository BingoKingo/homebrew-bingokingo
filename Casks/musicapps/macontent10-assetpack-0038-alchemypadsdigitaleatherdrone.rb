cask "macontent10-assetpack-0038-alchemypadsdigitaleatherdrone" do
  version "d6a94995e13da9541b8f339031e7bddc-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0038_AlchemyPadsDigitalEatherDrone.pkg"
  name "MAContent10_AssetPack_0038_AlchemyPadsDigitalEatherDrone"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0038_AlchemyPadsDigitalEatherDrone.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0038_AlchemyPadsDigitalEatherDrone.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0038_AlchemyPadsDigitalEatherDrone"
end
