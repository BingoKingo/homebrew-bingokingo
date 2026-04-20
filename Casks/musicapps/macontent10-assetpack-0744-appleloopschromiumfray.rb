cask "macontent10-assetpack-0744-appleloopschromiumfray" do
  version "396bc1827c0b4b4f716eeead1fac031f-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0744_AppleLoopsChromiumFray.pkg"
  name "MAContent10_AssetPack_0744_AppleLoopsChromiumFray"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0744_AppleLoopsChromiumFray.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0744_AppleLoopsChromiumFray.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0744_AppleLoopsChromiumFray"
end
