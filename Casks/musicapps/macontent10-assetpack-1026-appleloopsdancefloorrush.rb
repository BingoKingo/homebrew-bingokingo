cask "macontent10-assetpack-1026-appleloopsdancefloorrush" do
  version "767b2f8bd07b49f78c1bcfb35c0fa929-31"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1026_AppleLoopsDancefloorRush.pkg"
  name "MAContent10_AssetPack_1026_AppleLoopsDancefloorRush"
  desc "ContainsAppleLoops, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1026_AppleLoopsDancefloorRush.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1026_AppleLoopsDancefloorRush.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1026_AppleLoopsDancefloorRush"
end
