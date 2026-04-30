cask "macontent10-assetpack-0391-exs-texturesdroneserosion" do
  version "54e1c0dc3bec882f42d44a375cdfef90-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0391_EXS_TexturesDronesErosion.pkg"
  name "MAContent10_AssetPack_0391_EXS_TexturesDronesErosion"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0391_EXS_TexturesDronesErosion.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0391_EXS_TexturesDronesErosion.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0391_EXS_TexturesDronesErosion"
end
