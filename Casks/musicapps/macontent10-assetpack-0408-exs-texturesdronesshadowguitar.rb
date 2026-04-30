cask "macontent10-assetpack-0408-exs-texturesdronesshadowguitar" do
  version "21b48d57632044de03133ed23d9ce41e"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0408_EXS_TexturesDronesShadowGuitar.pkg"
  name "MAContent10_AssetPack_0408_EXS_TexturesDronesShadowGuitar"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0408_EXS_TexturesDronesShadowGuitar.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0408_EXS_TexturesDronesShadowGuitar.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0408_EXS_TexturesDronesShadowGuitar"
end
