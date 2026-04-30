cask "macontent10-assetpack-0055-alchemypadsdigitalendless" do
  version "43aa8bab3562a6aebf3050ad61da25f5-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0055_AlchemyPadsDigitalEndless.pkg"
  name "MAContent10_AssetPack_0055_AlchemyPadsDigitalEndless"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0055_AlchemyPadsDigitalEndless.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0055_AlchemyPadsDigitalEndless.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0055_AlchemyPadsDigitalEndless"
end
