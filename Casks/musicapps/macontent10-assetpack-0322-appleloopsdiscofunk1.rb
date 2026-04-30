cask "macontent10-assetpack-0322-appleloopsdiscofunk1" do
  version "17e785aa352cc5944af2f536cdedd142-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0322_AppleLoopsDiscoFunk1.pkg"
  name "MAContent10_AssetPack_0322_AppleLoopsDiscoFunk1"
  desc "ContainsAppleLoops, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0322_AppleLoopsDiscoFunk1.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0322_AppleLoopsDiscoFunk1.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0322_AppleLoopsDiscoFunk1"
end
