cask "macontent10-assetpack-0395-exs-texturesdronesglimmer" do
  version "9f55f099299b39fcd1867f795e5ac5c4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0395_EXS_TexturesDronesGlimmer.pkg"
  name "MAContent10_AssetPack_0395_EXS_TexturesDronesGlimmer"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0395_EXS_TexturesDronesGlimmer.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0395_EXS_TexturesDronesGlimmer.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0395_EXS_TexturesDronesGlimmer"
end
