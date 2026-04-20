cask "macontent10-assetpack-0118-alchemybassupright" do
  version "3115780d30e2ef170cbbc3015e71bb41-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0118_AlchemyBassUpright.pkg"
  name "MAContent10_AssetPack_0118_AlchemyBassUpright"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0118_AlchemyBassUpright.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0118_AlchemyBassUpright.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0118_AlchemyBassUpright"
end
