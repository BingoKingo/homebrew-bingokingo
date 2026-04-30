cask "macontent10-assetpack-0959-appleloopshardwell" do
  version "b085ea8badbe7592e548da1a3de724a8-15"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0959_AppleLoopsHardwell.pkg"
  name "MAContent10_AssetPack_0959_AppleLoopsHardwell"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0959_AppleLoopsHardwell.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0959_AppleLoopsHardwell.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0959_AppleLoopsHardwell"
end
