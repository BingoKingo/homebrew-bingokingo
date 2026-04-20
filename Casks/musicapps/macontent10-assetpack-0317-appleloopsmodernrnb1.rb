cask "macontent10-assetpack-0317-appleloopsmodernrnb1" do
  version "11a18e98852ba62752e75579dd6ffb21-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0317_AppleLoopsModernRnB1.pkg"
  name "MAContent10_AssetPack_0317_AppleLoopsModernRnB1"
  desc "ContainsAppleLoops, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0317_AppleLoopsModernRnB1.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0317_AppleLoopsModernRnB1.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0317_AppleLoopsModernRnB1"
end
