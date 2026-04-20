cask "macontent10-assetpack-0409-exs-texturesdronessnowflakes" do
  version "3178629e569c7e86486e60d52c4684cf"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0409_EXS_TexturesDronesSnowflakes.pkg"
  name "MAContent10_AssetPack_0409_EXS_TexturesDronesSnowflakes"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0409_EXS_TexturesDronesSnowflakes.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0409_EXS_TexturesDronesSnowflakes.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0409_EXS_TexturesDronesSnowflakes"
end
