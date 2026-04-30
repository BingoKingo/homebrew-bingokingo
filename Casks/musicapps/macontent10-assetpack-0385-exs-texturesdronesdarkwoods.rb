cask "macontent10-assetpack-0385-exs-texturesdronesdarkwoods" do
  version "e5055ccea1ab86d705bd5b13bbe15c02"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0385_EXS_TexturesDronesDarkWoods.pkg"
  name "MAContent10_AssetPack_0385_EXS_TexturesDronesDarkWoods"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0385_EXS_TexturesDronesDarkWoods.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0385_EXS_TexturesDronesDarkWoods.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0385_EXS_TexturesDronesDarkWoods"
end
