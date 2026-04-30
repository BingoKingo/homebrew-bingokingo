cask "macontent10-assetpack-0396-exs-texturesdronesluciddream" do
  version "0ad5cd6212437bf32b30fa1dcf91e089-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0396_EXS_TexturesDronesLucidDream.pkg"
  name "MAContent10_AssetPack_0396_EXS_TexturesDronesLucidDream"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0396_EXS_TexturesDronesLucidDream.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0396_EXS_TexturesDronesLucidDream.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0396_EXS_TexturesDronesLucidDream"
end
