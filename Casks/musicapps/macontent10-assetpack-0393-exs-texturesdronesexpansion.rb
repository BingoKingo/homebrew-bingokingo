cask "macontent10-assetpack-0393-exs-texturesdronesexpansion" do
  version "cd8068be8f38bf6ead0a0a3891993347-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0393_EXS_TexturesDronesExpansion.pkg"
  name "MAContent10_AssetPack_0393_EXS_TexturesDronesExpansion"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0393_EXS_TexturesDronesExpansion.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0393_EXS_TexturesDronesExpansion.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0393_EXS_TexturesDronesExpansion"
end
