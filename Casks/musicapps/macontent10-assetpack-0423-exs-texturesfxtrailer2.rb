cask "macontent10-assetpack-0423-exs-texturesfxtrailer2" do
  version "6ac26a603f47daf7984f5fc719671d84-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0423_EXS_TexturesFXTrailer2.pkg"
  name "MAContent10_AssetPack_0423_EXS_TexturesFXTrailer2"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0423_EXS_TexturesFXTrailer2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0423_EXS_TexturesFXTrailer2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0423_EXS_TexturesFXTrailer2"
end
