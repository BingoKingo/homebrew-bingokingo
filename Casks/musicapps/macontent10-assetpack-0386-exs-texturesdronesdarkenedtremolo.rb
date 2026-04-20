cask "macontent10-assetpack-0386-exs-texturesdronesdarkenedtremolo" do
  version "93a25b5efe6ac263210f65fbe04d8bec"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0386_EXS_TexturesDronesDarkenedTremolo.pkg"
  name "MAContent10_AssetPack_0386_EXS_TexturesDronesDarkenedTremolo"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0386_EXS_TexturesDronesDarkenedTremolo.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0386_EXS_TexturesDronesDarkenedTremolo.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0386_EXS_TexturesDronesDarkenedTremolo"
end
