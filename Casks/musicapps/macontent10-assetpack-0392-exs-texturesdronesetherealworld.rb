cask "macontent10-assetpack-0392-exs-texturesdronesetherealworld" do
  version "544cf5dc67dec94b535ef90dea667d58-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0392_EXS_TexturesDronesEtherealWorld.pkg"
  name "MAContent10_AssetPack_0392_EXS_TexturesDronesEtherealWorld"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0392_EXS_TexturesDronesEtherealWorld.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0392_EXS_TexturesDronesEtherealWorld.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0392_EXS_TexturesDronesEtherealWorld"
end
