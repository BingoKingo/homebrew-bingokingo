cask "macontent10-assetpack-0828-alchemysamplesultimate808s" do
  version "d2dd48bbdbae4485b36c983806424e93"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0828_AlchemySamplesUltimate808s.pkg"
  name "MAContent10_AssetPack_0828_AlchemySamplesUltimate808s"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0828_AlchemySamplesUltimate808s.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0828_AlchemySamplesUltimate808s.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0828_AlchemySamplesUltimate808s"
end
