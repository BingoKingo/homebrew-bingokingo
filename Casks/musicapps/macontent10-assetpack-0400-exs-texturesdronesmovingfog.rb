cask "macontent10-assetpack-0400-exs-texturesdronesmovingfog" do
  version "c8b613586b7ea9b12735c0322305bcb1"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0400_EXS_TexturesDronesMovingFog.pkg"
  name "MAContent10_AssetPack_0400_EXS_TexturesDronesMovingFog"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0400_EXS_TexturesDronesMovingFog.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0400_EXS_TexturesDronesMovingFog.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0400_EXS_TexturesDronesMovingFog"
end
