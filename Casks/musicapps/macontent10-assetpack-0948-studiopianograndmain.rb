cask "macontent10-assetpack-0948-studiopianograndmain" do
  version "153544180f41dbc44fbc0fb9fd2cc785-74"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0948_StudioPianoGrandMain.pkg"
  name "MAContent10_AssetPack_0948_StudioPianoGrandMain"
  desc "IsEssentialAddition"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0948_StudioPianoGrandMain.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0948_StudioPianoGrandMain.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0948_StudioPianoGrandMain"
end
