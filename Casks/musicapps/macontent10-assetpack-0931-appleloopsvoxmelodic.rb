cask "macontent10-assetpack-0931-appleloopsvoxmelodic" do
  version "19caab65532ca46486e10f0864e1b0f6-10"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0931_AppleLoopsVoxMelodic.pkg"
  name "MAContent10_AssetPack_0931_AppleLoopsVoxMelodic"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0931_AppleLoopsVoxMelodic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0931_AppleLoopsVoxMelodic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0931_AppleLoopsVoxMelodic"
end
