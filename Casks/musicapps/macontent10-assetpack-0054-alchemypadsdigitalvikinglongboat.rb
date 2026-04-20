cask "macontent10-assetpack-0054-alchemypadsdigitalvikinglongboat" do
  version "614c2751663cc81531a7802f38ff7609-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0054_AlchemyPadsDigitalVikingLongboat.pkg"
  name "MAContent10_AssetPack_0054_AlchemyPadsDigitalVikingLongboat"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0054_AlchemyPadsDigitalVikingLongboat.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0054_AlchemyPadsDigitalVikingLongboat.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0054_AlchemyPadsDigitalVikingLongboat"
end
