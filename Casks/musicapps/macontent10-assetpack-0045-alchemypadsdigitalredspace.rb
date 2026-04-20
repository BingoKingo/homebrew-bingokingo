cask "macontent10-assetpack-0045-alchemypadsdigitalredspace" do
  version "811d36be26192023654278d7bcb652cd-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0045_AlchemyPadsDigitalRedspace.pkg"
  name "MAContent10_AssetPack_0045_AlchemyPadsDigitalRedspace"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0045_AlchemyPadsDigitalRedspace.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0045_AlchemyPadsDigitalRedspace.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0045_AlchemyPadsDigitalRedspace"
end
