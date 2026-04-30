cask "macontent10-assetpack-0695-exs-studiohornssingle" do
  version "9a25403e204a2ffd25b9b1344dcc2f61-180"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0695_EXS_StudioHornsSingle.pkg"
  name "MAContent10_AssetPack_0695_EXS_StudioHornsSingle"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0695_EXS_StudioHornsSingle.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0695_EXS_StudioHornsSingle.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0695_EXS_StudioHornsSingle"
end
