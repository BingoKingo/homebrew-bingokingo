cask "macontent10-assetpack-0040-alchemypadsdigitalphasedpad" do
  version "410f6fad44c99e18828f6d60f7cda9d9-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0040_AlchemyPadsDigitalPhasedPad.pkg"
  name "MAContent10_AssetPack_0040_AlchemyPadsDigitalPhasedPad"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0040_AlchemyPadsDigitalPhasedPad.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0040_AlchemyPadsDigitalPhasedPad.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0040_AlchemyPadsDigitalPhasedPad"
end
