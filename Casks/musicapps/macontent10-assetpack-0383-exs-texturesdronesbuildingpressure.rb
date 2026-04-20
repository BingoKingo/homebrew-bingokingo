cask "macontent10-assetpack-0383-exs-texturesdronesbuildingpressure" do
  version "f22ca2b972b1c8669d413837cef303dc"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0383_EXS_TexturesDronesBuildingPressure.pkg"
  name "MAContent10_AssetPack_0383_EXS_TexturesDronesBuildingPressure"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0383_EXS_TexturesDronesBuildingPressure.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0383_EXS_TexturesDronesBuildingPressure.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0383_EXS_TexturesDronesBuildingPressure"
end
