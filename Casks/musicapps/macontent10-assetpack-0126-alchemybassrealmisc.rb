cask "macontent10-assetpack-0126-alchemybassrealmisc" do
  version "c0556d7360b4be3ea3f919a0a0e7b684"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0126_AlchemyBassRealMisc.pkg"
  name "MAContent10_AssetPack_0126_AlchemyBassRealMisc"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0126_AlchemyBassRealMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0126_AlchemyBassRealMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0126_AlchemyBassRealMisc"
end
