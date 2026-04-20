cask "macontent10-assetpack-0390-exs-texturesdronesentranced" do
  version "bdde93c4841f78284adba1955d147661-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0390_EXS_TexturesDronesEntranced.pkg"
  name "MAContent10_AssetPack_0390_EXS_TexturesDronesEntranced"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0390_EXS_TexturesDronesEntranced.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0390_EXS_TexturesDronesEntranced.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0390_EXS_TexturesDronesEntranced"
end
