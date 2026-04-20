cask "macontent10-assetpack-0885-appleloopsalphawaves" do
  version "362eb53320da09b93f07b3a13457027d-22"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0885_AppleLoopsAlphaWaves.pkg"
  name "MAContent10_AssetPack_0885_AppleLoopsAlphaWaves"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0885_AppleLoopsAlphaWaves.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0885_AppleLoopsAlphaWaves.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0885_AppleLoopsAlphaWaves"
end
