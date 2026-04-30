cask "macontent10-assetpack-0095-alchemybassanalogsquoscreset" do
  version "d5d134185d14797750744a0d5e79dcec-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0095_AlchemyBassAnalogSquOscReset.pkg"
  name "MAContent10_AssetPack_0095_AlchemyBassAnalogSquOscReset"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0095_AlchemyBassAnalogSquOscReset.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0095_AlchemyBassAnalogSquOscReset.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0095_AlchemyBassAnalogSquOscReset"
end
