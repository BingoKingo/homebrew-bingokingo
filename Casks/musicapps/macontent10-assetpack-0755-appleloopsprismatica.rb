cask "macontent10-assetpack-0755-appleloopsprismatica" do
  version "ed9a030f4521ef316565613381bf8ae6-10"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0755_AppleLoopsPrismatica.pkg"
  name "MAContent10_AssetPack_0755_AppleLoopsPrismatica"
  desc "ContainsAppleLoops, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0755_AppleLoopsPrismatica.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0755_AppleLoopsPrismatica.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0755_AppleLoopsPrismatica"
end
