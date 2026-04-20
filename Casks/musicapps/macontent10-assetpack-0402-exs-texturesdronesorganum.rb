cask "macontent10-assetpack-0402-exs-texturesdronesorganum" do
  version "ac899d23cfb66d0eb17b8a0563a618c2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0402_EXS_TexturesDronesOrganum.pkg"
  name "MAContent10_AssetPack_0402_EXS_TexturesDronesOrganum"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0402_EXS_TexturesDronesOrganum.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0402_EXS_TexturesDronesOrganum.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0402_EXS_TexturesDronesOrganum"
end
