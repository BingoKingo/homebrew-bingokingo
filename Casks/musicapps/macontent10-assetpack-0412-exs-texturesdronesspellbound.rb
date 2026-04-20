cask "macontent10-assetpack-0412-exs-texturesdronesspellbound" do
  version "0066ca5ca47c97b23ecaadb93eac415d-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0412_EXS_TexturesDronesSpellbound.pkg"
  name "MAContent10_AssetPack_0412_EXS_TexturesDronesSpellbound"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0412_EXS_TexturesDronesSpellbound.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0412_EXS_TexturesDronesSpellbound.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0412_EXS_TexturesDronesSpellbound"
end
