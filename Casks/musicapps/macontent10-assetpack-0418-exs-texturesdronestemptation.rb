cask "macontent10-assetpack-0418-exs-texturesdronestemptation" do
  version "547a2b8224b4133e4bd1a6c9a57495c0-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0418_EXS_TexturesDronesTemptation.pkg"
  name "MAContent10_AssetPack_0418_EXS_TexturesDronesTemptation"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0418_EXS_TexturesDronesTemptation.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0418_EXS_TexturesDronesTemptation.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0418_EXS_TexturesDronesTemptation"
end
