cask "macontent10-assetpack-0344-irswarpedspeakers" do
  version "ce6f4cfa612086cbf978e79f5f3e3a17"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0344_IRsWarpedSpeakers.pkg"
  name "MAContent10_AssetPack_0344_IRsWarpedSpeakers"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0344_IRsWarpedSpeakers.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0344_IRsWarpedSpeakers.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0344_IRsWarpedSpeakers"
end
