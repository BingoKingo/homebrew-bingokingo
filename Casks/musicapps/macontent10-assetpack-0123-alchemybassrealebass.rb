cask "macontent10-assetpack-0123-alchemybassrealebass" do
  version "bdf200475a4ccd8dc0aca9d835f92582-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0123_AlchemyBassRealEBass.pkg"
  name "MAContent10_AssetPack_0123_AlchemyBassRealEBass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0123_AlchemyBassRealEBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0123_AlchemyBassRealEBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0123_AlchemyBassRealEBass"
end
