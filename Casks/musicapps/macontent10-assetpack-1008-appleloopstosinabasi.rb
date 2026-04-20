cask "macontent10-assetpack-1008-appleloopstosinabasi" do
  version "852a41c4ae16688c5f73e4e8192b976f"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1008_AppleLoopsTosinAbasi.pkg"
  name "MAContent10_AssetPack_1008_AppleLoopsTosinAbasi"
  desc "ContainsAppleLoops, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1008_AppleLoopsTosinAbasi.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1008_AppleLoopsTosinAbasi.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1008_AppleLoopsTosinAbasi"
end
