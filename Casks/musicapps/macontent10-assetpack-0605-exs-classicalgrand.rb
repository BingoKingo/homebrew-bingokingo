cask "macontent10-assetpack-0605-exs-classicalgrand" do
  version "cc9fa2042c6e42c67c433dca909d4638-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0605_EXS_ClassicalGrand.pkg"
  name "MAContent10_AssetPack_0605_EXS_ClassicalGrand"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0605_EXS_ClassicalGrand.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0605_EXS_ClassicalGrand.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0605_EXS_ClassicalGrand"
end
