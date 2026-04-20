cask "macontent10-assetpack-0510-exs-strings" do
  version "31f9a6eb14c3a01f09ceb2dfe3d388ad-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0510_EXS_Strings.pkg"
  name "MAContent10_AssetPack_0510_EXS_Strings"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0510_EXS_Strings.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0510_EXS_Strings.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0510_EXS_Strings"
end
