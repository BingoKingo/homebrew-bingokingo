cask "macontent10-assetpack-0387-exs-texturesdronesdreamscape" do
  version "b2cde9eb0dd530603ca64e8de0242dbe-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0387_EXS_TexturesDronesDreamscape.pkg"
  name "MAContent10_AssetPack_0387_EXS_TexturesDronesDreamscape"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0387_EXS_TexturesDronesDreamscape.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0387_EXS_TexturesDronesDreamscape.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0387_EXS_TexturesDronesDreamscape"
end
