cask "macontent10-assetpack-0058-alchemypadsdigitalseismicshift" do
  version "124db13fea0c33ebcc07d05fa58d700c-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0058_AlchemyPadsDigitalSeismicShift.pkg"
  name "MAContent10_AssetPack_0058_AlchemyPadsDigitalSeismicShift"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0058_AlchemyPadsDigitalSeismicShift.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0058_AlchemyPadsDigitalSeismicShift.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0058_AlchemyPadsDigitalSeismicShift"
end
