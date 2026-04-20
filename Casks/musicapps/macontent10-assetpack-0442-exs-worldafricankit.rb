cask "macontent10-assetpack-0442-exs-worldafricankit" do
  version "b40eb735d17dec3b1dc5303d8c246365-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0442_EXS_WorldAfricanKit.pkg"
  name "MAContent10_AssetPack_0442_EXS_WorldAfricanKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0442_EXS_WorldAfricanKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0442_EXS_WorldAfricanKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0442_EXS_WorldAfricanKit"
end
