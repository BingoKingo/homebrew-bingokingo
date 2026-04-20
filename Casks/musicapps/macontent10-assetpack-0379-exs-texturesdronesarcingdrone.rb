cask "macontent10-assetpack-0379-exs-texturesdronesarcingdrone" do
  version "26a71c73ba392bd7c666afb95efc7aca"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0379_EXS_TexturesDronesArcingDrone.pkg"
  name "MAContent10_AssetPack_0379_EXS_TexturesDronesArcingDrone"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0379_EXS_TexturesDronesArcingDrone.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0379_EXS_TexturesDronesArcingDrone.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0379_EXS_TexturesDronesArcingDrone"
end
