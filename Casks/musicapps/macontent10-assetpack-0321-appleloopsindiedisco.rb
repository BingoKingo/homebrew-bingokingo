cask "macontent10-assetpack-0321-appleloopsindiedisco" do
  version "5566ca59485390d8c128903d1e216322-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0321_AppleLoopsIndieDisco.pkg"
  name "MAContent10_AssetPack_0321_AppleLoopsIndieDisco"
  desc "ContainsAppleLoops, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0321_AppleLoopsIndieDisco.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0321_AppleLoopsIndieDisco.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0321_AppleLoopsIndieDisco"
end
