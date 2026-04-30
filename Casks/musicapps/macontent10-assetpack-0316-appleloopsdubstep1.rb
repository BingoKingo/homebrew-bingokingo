cask "macontent10-assetpack-0316-appleloopsdubstep1" do
  version "8ef3c74bc4e92754b83e0003b4228378"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0316_AppleLoopsDubstep1.pkg"
  name "MAContent10_AssetPack_0316_AppleLoopsDubstep1"
  desc "ContainsAppleLoops, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0316_AppleLoopsDubstep1.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0316_AppleLoopsDubstep1.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0316_AppleLoopsDubstep1"
end
