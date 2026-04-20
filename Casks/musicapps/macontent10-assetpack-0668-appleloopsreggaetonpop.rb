cask "macontent10-assetpack-0668-appleloopsreggaetonpop" do
  version "249cc860f10f6b2e0ba4208a702444e8-12"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0668_AppleLoopsReggaetonPop.pkg"
  name "MAContent10_AssetPack_0668_AppleLoopsReggaetonPop"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0668_AppleLoopsReggaetonPop.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0668_AppleLoopsReggaetonPop.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0668_AppleLoopsReggaetonPop"
end
