cask "macontent10-assetpack-0389-exs-texturesdronesedgycycles" do
  version "2bfe843acc7c65b525970c3be84c3a72"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0389_EXS_TexturesDronesEdgyCycles.pkg"
  name "MAContent10_AssetPack_0389_EXS_TexturesDronesEdgyCycles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0389_EXS_TexturesDronesEdgyCycles.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0389_EXS_TexturesDronesEdgyCycles.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0389_EXS_TexturesDronesEdgyCycles"
end
