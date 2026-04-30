cask "macontent10-assetpack-0421-exs-texturesfxegdebass" do
  version "e102ccabdffa665be28eba5f9323af7e-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0421_EXS_TexturesFXEgdeBass.pkg"
  name "MAContent10_AssetPack_0421_EXS_TexturesFXEgdeBass"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0421_EXS_TexturesFXEgdeBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0421_EXS_TexturesFXEgdeBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0421_EXS_TexturesFXEgdeBass"
end
