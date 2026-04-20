cask "macontent10-assetpack-0667-appleloopsfuturebass" do
  version "1db6c800b8e335e5af8f99a53a7cea05-10"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0667_AppleLoopsFutureBass.pkg"
  name "MAContent10_AssetPack_0667_AppleLoopsFutureBass"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0667_AppleLoopsFutureBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0667_AppleLoopsFutureBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0667_AppleLoopsFutureBass"
end
