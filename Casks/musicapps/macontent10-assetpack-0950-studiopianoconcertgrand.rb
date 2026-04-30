cask "macontent10-assetpack-0950-studiopianoconcertgrand" do
  version "af3e9b7d9b9c917fd398b7b6b05fa327-73"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0950_StudioPianoConcertGrand.pkg"
  name "MAContent10_AssetPack_0950_StudioPianoConcertGrand"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0950_StudioPianoConcertGrand.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0950_StudioPianoConcertGrand.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0950_StudioPianoConcertGrand"
end
