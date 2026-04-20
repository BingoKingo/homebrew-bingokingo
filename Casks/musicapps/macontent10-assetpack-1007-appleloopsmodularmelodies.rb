cask "macontent10-assetpack-1007-appleloopsmodularmelodies" do
  version "8dc217d1213db7c35e8020a99cc965a8-16"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1007_AppleLoopsModularMelodies.pkg"
  name "MAContent10_AssetPack_1007_AppleLoopsModularMelodies"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1007_AppleLoopsModularMelodies.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1007_AppleLoopsModularMelodies.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1007_AppleLoopsModularMelodies"
end
