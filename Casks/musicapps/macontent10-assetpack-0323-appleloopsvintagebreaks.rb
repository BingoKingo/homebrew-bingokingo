cask "macontent10-assetpack-0323-appleloopsvintagebreaks" do
  version "803caadc1cf6bf8b86f6877dada3c776-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0323_AppleLoopsVintageBreaks.pkg"
  name "MAContent10_AssetPack_0323_AppleLoopsVintageBreaks"
  desc "ContainsAppleLoops, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0323_AppleLoopsVintageBreaks.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0323_AppleLoopsVintageBreaks.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0323_AppleLoopsVintageBreaks"
end
