cask "macontent10-assetpack-0888-appleloopsstepsequencerb" do
  version "946a9cdcac96f617f486e046893f224a-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0888_AppleLoopsStepSequencerB.pkg"
  name "MAContent10_AssetPack_0888_AppleLoopsStepSequencerB"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0888_AppleLoopsStepSequencerB.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0888_AppleLoopsStepSequencerB.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0888_AppleLoopsStepSequencerB"
end
