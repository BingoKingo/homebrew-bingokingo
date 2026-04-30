cask "macontent10-assetpack-0405-exs-texturesdronespressuredorgan" do
  version "274fac69129be404ce17e0aef283dc30"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0405_EXS_TexturesDronesPressuredOrgan.pkg"
  name "MAContent10_AssetPack_0405_EXS_TexturesDronesPressuredOrgan"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0405_EXS_TexturesDronesPressuredOrgan.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0405_EXS_TexturesDronesPressuredOrgan.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0405_EXS_TexturesDronesPressuredOrgan"
end
