cask "macontent10-assetpack-0424-exs-texturesfxtrailer3" do
  version "9d1c8013ab35fde28cc5cb7e388e30b7-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0424_EXS_TexturesFXTrailer3.pkg"
  name "MAContent10_AssetPack_0424_EXS_TexturesFXTrailer3"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0424_EXS_TexturesFXTrailer3.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0424_EXS_TexturesFXTrailer3.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0424_EXS_TexturesFXTrailer3"
end
