cask "macontent10-assetpack-0651-exs-studiostrings" do
  version "0f984cd7e3a3bf658788b113b141f851-364"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0651_EXS_StudioStrings.pkg"
  name "MAContent10_AssetPack_0651_EXS_StudioStrings"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0651_EXS_StudioStrings.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0651_EXS_StudioStrings.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0651_EXS_StudioStrings"
end
