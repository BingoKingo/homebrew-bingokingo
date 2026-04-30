cask "macontent10-assetpack-0936-appleloopsthekount" do
  version "b9ce4d8a5934504b68ff122bf3d537a7-14"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0936_AppleLoopsTheKount.pkg"
  name "MAContent10_AssetPack_0936_AppleLoopsTheKount"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0936_AppleLoopsTheKount.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0936_AppleLoopsTheKount.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0936_AppleLoopsTheKount"
end
