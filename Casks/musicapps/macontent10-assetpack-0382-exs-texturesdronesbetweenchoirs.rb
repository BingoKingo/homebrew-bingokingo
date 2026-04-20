cask "macontent10-assetpack-0382-exs-texturesdronesbetweenchoirs" do
  version "cb38b1985c1dede08d7a7cfd83c79aa2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0382_EXS_TexturesDronesBetweenChoirs.pkg"
  name "MAContent10_AssetPack_0382_EXS_TexturesDronesBetweenChoirs"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0382_EXS_TexturesDronesBetweenChoirs.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0382_EXS_TexturesDronesBetweenChoirs.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0382_EXS_TexturesDronesBetweenChoirs"
end
