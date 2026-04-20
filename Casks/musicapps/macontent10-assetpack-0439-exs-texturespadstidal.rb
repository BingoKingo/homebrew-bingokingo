cask "macontent10-assetpack-0439-exs-texturespadstidal" do
  version "7a29f9e95ead52a32caee51b76b834c1"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0439_EXS_TexturesPadsTidal.pkg"
  name "MAContent10_AssetPack_0439_EXS_TexturesPadsTidal"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0439_EXS_TexturesPadsTidal.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0439_EXS_TexturesPadsTidal.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0439_EXS_TexturesPadsTidal"
end
