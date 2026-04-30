cask "macontent10-assetpack-0094-alchemybassanalogvco1ressaw" do
  version "a9bee0e2aacfae2479896f8818291014-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0094_AlchemyBassAnalogVCO1ResSaw.pkg"
  name "MAContent10_AssetPack_0094_AlchemyBassAnalogVCO1ResSaw"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0094_AlchemyBassAnalogVCO1ResSaw.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0094_AlchemyBassAnalogVCO1ResSaw.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0094_AlchemyBassAnalogVCO1ResSaw"
end
