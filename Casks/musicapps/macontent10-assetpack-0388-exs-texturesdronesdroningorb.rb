cask "macontent10-assetpack-0388-exs-texturesdronesdroningorb" do
  version "d3efc1e8cec8c8084ceabaca0f4a2673"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0388_EXS_TexturesDronesDroningOrb.pkg"
  name "MAContent10_AssetPack_0388_EXS_TexturesDronesDroningOrb"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0388_EXS_TexturesDronesDroningOrb.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0388_EXS_TexturesDronesDroningOrb.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0388_EXS_TexturesDronesDroningOrb"
end
