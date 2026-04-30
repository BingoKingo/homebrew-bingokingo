cask "macontent10-assetpack-0328-appleloopsjamrhythmsection" do
  version "b082fe9d9ac7ca1d5965bb6be0581b18-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0328_AppleLoopsJamRhythmSection.pkg"
  name "MAContent10_AssetPack_0328_AppleLoopsJamRhythmSection"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0328_AppleLoopsJamRhythmSection.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0328_AppleLoopsJamRhythmSection.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0328_AppleLoopsJamRhythmSection"
end
