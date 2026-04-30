cask "macontent10-assetpack-0414-exs-texturesdronesspreadingrain" do
  version "9dc516ebfed52322c095ef26df34e989"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0414_EXS_TexturesDronesSpreadingRain.pkg"
  name "MAContent10_AssetPack_0414_EXS_TexturesDronesSpreadingRain"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0414_EXS_TexturesDronesSpreadingRain.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0414_EXS_TexturesDronesSpreadingRain.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0414_EXS_TexturesDronesSpreadingRain"
end
