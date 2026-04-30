cask "macontent10-assetpack-0119-alchemybassjazz" do
  version "4509072195f0522d5ad4eb1c134a5f8a-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0119_AlchemyBassJazz.pkg"
  name "MAContent10_AssetPack_0119_AlchemyBassJazz"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0119_AlchemyBassJazz.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0119_AlchemyBassJazz.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0119_AlchemyBassJazz"
end
