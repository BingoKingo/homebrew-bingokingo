cask "macontent10-assetpack-0663-appleloopsdrummertyrell" do
  version "e43612e3fc3d89cacb8c2609f66c0949-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0663_AppleLoopsDrummerTyrell.pkg"
  name "MAContent10_AssetPack_0663_AppleLoopsDrummerTyrell"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0663_AppleLoopsDrummerTyrell.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0663_AppleLoopsDrummerTyrell.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0663_AppleLoopsDrummerTyrell"
end
