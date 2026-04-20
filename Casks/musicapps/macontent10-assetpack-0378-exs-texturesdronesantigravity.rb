cask "macontent10-assetpack-0378-exs-texturesdronesantigravity" do
  version "d49ce008f1b87680209d4c091c801c0d-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0378_EXS_TexturesDronesAntigravity.pkg"
  name "MAContent10_AssetPack_0378_EXS_TexturesDronesAntigravity"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0378_EXS_TexturesDronesAntigravity.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0378_EXS_TexturesDronesAntigravity.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0378_EXS_TexturesDronesAntigravity"
end
