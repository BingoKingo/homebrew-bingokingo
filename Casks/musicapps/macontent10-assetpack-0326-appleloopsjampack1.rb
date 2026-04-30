cask "macontent10-assetpack-0326-appleloopsjampack1" do
  version "1bbdb91fc32d6c3039c3bd77d8d0e914-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0326_AppleLoopsJamPack1.pkg"
  name "MAContent10_AssetPack_0326_AppleLoopsJamPack1"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0326_AppleLoopsJamPack1.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0326_AppleLoopsJamPack1.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0326_AppleLoopsJamPack1"
end
