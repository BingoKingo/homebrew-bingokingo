cask "macontent10-assetpack-0428-exs-texturespadscavernous" do
  version "fb0a0fbd4f24ae95baa7e4d59bd60241"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0428_EXS_TexturesPadsCavernous.pkg"
  name "MAContent10_AssetPack_0428_EXS_TexturesPadsCavernous"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0428_EXS_TexturesPadsCavernous.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0428_EXS_TexturesPadsCavernous.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0428_EXS_TexturesPadsCavernous"
end
