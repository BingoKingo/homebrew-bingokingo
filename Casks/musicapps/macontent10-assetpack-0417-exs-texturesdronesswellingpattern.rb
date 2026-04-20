cask "macontent10-assetpack-0417-exs-texturesdronesswellingpattern" do
  version "7f9580af229bb3c14612af22630c26d8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0417_EXS_TexturesDronesSwellingPattern.pkg"
  name "MAContent10_AssetPack_0417_EXS_TexturesDronesSwellingPattern"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0417_EXS_TexturesDronesSwellingPattern.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0417_EXS_TexturesDronesSwellingPattern.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0417_EXS_TexturesDronesSwellingPattern"
end
