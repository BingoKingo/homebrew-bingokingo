cask "macontent10-assetpack-0406-exs-texturesdronesradiantguitar" do
  version "5d633deecca31ec3db6140435c45c2db-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0406_EXS_TexturesDronesRadiantGuitar.pkg"
  name "MAContent10_AssetPack_0406_EXS_TexturesDronesRadiantGuitar"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0406_EXS_TexturesDronesRadiantGuitar.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0406_EXS_TexturesDronesRadiantGuitar.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0406_EXS_TexturesDronesRadiantGuitar"
end
