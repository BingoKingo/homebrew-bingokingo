cask "macontent10-assetpack-0958-studiobassrock" do
  version "b0ea5a80c1279d15a34e1afa2c84c6ef-141"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0958_StudioBassRock.pkg"
  name "MAContent10_AssetPack_0958_StudioBassRock"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0958_StudioBassRock.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0958_StudioBassRock.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0958_StudioBassRock"
end
