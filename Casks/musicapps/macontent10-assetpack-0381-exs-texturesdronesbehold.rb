cask "macontent10-assetpack-0381-exs-texturesdronesbehold" do
  version "146e103209ad5632c457a8d034132d06-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0381_EXS_TexturesDronesBehold.pkg"
  name "MAContent10_AssetPack_0381_EXS_TexturesDronesBehold"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0381_EXS_TexturesDronesBehold.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0381_EXS_TexturesDronesBehold.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0381_EXS_TexturesDronesBehold"
end
