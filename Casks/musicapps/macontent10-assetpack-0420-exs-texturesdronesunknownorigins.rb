cask "macontent10-assetpack-0420-exs-texturesdronesunknownorigins" do
  version "fbd980f49e5944029a4dcd53f26ae95d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0420_EXS_TexturesDronesUnknownOrigins.pkg"
  name "MAContent10_AssetPack_0420_EXS_TexturesDronesUnknownOrigins"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0420_EXS_TexturesDronesUnknownOrigins.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0420_EXS_TexturesDronesUnknownOrigins.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0420_EXS_TexturesDronesUnknownOrigins"
end
