cask "macontent10-assetpack-0394-exs-texturesdronesgamelanglow" do
  version "e2e716f1ef3cea76a52a03376499d72f"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0394_EXS_TexturesDronesGamelanGlow.pkg"
  name "MAContent10_AssetPack_0394_EXS_TexturesDronesGamelanGlow"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0394_EXS_TexturesDronesGamelanGlow.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0394_EXS_TexturesDronesGamelanGlow.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0394_EXS_TexturesDronesGamelanGlow"
end
