cask "macontent10-assetpack-0425-exs-texturesfxothers" do
  version "d70b22bf2c3bcfeb417d607de9ea883f"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0425_EXS_TexturesFXOthers.pkg"
  name "MAContent10_AssetPack_0425_EXS_TexturesFXOthers"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0425_EXS_TexturesFXOthers.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0425_EXS_TexturesFXOthers.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0425_EXS_TexturesFXOthers"
end
