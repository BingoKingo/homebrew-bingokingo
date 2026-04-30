cask "macontent10-assetpack-0739-appleloopsfuturebass2" do
  version "141bf05bf69bbaaa5f160d59aa1a3a0e-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0739_AppleLoopsFutureBass2.pkg"
  name "MAContent10_AssetPack_0739_AppleLoopsFutureBass2"
  desc "ContainsAppleLoops, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0739_AppleLoopsFutureBass2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0739_AppleLoopsFutureBass2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0739_AppleLoopsFutureBass2"
end
