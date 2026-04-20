cask "macontent10-assetpack-0921-appleloops8bitlegends" do
  version "84b8ebaa7d153a82fbe107c43812ab97-10"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0921_AppleLoops8BitLegends.pkg"
  name "MAContent10_AssetPack_0921_AppleLoops8BitLegends"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0921_AppleLoops8BitLegends.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0921_AppleLoops8BitLegends.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0921_AppleLoops8BitLegends"
end
