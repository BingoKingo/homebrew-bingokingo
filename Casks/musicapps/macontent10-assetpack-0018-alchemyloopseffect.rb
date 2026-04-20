cask "macontent10-assetpack-0018-alchemyloopseffect" do
  version "6c20480c0fd39f81338a9491ab14f50e-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0018_AlchemyLoopsEffect.pkg"
  name "MAContent10_AssetPack_0018_AlchemyLoopsEffect"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0018_AlchemyLoopsEffect.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0018_AlchemyLoopsEffect.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0018_AlchemyLoopsEffect"
end
