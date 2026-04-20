cask "macontent10-assetpack-0795-appleloopsstepsequencer" do
  version "4aa101314154407030b69e3885ea7a92-10"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0795_AppleLoopsStepSequencer.pkg"
  name "MAContent10_AssetPack_0795_AppleLoopsStepSequencer"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0795_AppleLoopsStepSequencer.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0795_AppleLoopsStepSequencer.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0795_AppleLoopsStepSequencer"
end
