cask "macontent10-assetpack-0384-exs-texturesdronescosmology" do
  version "720baa171bcfc621b7407801848a04ac-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0384_EXS_TexturesDronesCosmology.pkg"
  name "MAContent10_AssetPack_0384_EXS_TexturesDronesCosmology"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0384_EXS_TexturesDronesCosmology.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0384_EXS_TexturesDronesCosmology.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0384_EXS_TexturesDronesCosmology"
end
