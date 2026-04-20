cask "macontent10-assetpack-0397-exs-texturesdronesluminousdecay" do
  version "a599875e4b2f479284ba44666115c2f6-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0397_EXS_TexturesDronesLuminousDecay.pkg"
  name "MAContent10_AssetPack_0397_EXS_TexturesDronesLuminousDecay"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0397_EXS_TexturesDronesLuminousDecay.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0397_EXS_TexturesDronesLuminousDecay.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0397_EXS_TexturesDronesLuminousDecay"
end
