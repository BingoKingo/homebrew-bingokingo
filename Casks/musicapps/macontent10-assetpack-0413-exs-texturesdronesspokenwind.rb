cask "macontent10-assetpack-0413-exs-texturesdronesspokenwind" do
  version "91dac1ec93e4110ed4e00bc03d89f1eb"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0413_EXS_TexturesDronesSpokenWind.pkg"
  name "MAContent10_AssetPack_0413_EXS_TexturesDronesSpokenWind"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0413_EXS_TexturesDronesSpokenWind.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0413_EXS_TexturesDronesSpokenWind.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0413_EXS_TexturesDronesSpokenWind"
end
