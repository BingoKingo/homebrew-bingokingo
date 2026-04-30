cask "macontent10-assetpack-0422-exs-texturesfxtrailer1" do
  version "9ad714b472e8126f1081790fd13486a7-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0422_EXS_TexturesFXTrailer1.pkg"
  name "MAContent10_AssetPack_0422_EXS_TexturesFXTrailer1"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0422_EXS_TexturesFXTrailer1.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0422_EXS_TexturesFXTrailer1.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0422_EXS_TexturesFXTrailer1"
end
