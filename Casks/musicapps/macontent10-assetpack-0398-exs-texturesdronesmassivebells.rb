cask "macontent10-assetpack-0398-exs-texturesdronesmassivebells" do
  version "f42288993dda883c6bf6113b6e7d91b4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0398_EXS_TexturesDronesMassiveBells.pkg"
  name "MAContent10_AssetPack_0398_EXS_TexturesDronesMassiveBells"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0398_EXS_TexturesDronesMassiveBells.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0398_EXS_TexturesDronesMassiveBells.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0398_EXS_TexturesDronesMassiveBells"
end
