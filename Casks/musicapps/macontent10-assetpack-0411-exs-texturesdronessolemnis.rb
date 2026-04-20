cask "macontent10-assetpack-0411-exs-texturesdronessolemnis" do
  version "3d70003fe58bfa8252f487afbeb84c0c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0411_EXS_TexturesDronesSolemnis.pkg"
  name "MAContent10_AssetPack_0411_EXS_TexturesDronesSolemnis"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0411_EXS_TexturesDronesSolemnis.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0411_EXS_TexturesDronesSolemnis.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0411_EXS_TexturesDronesSolemnis"
end
