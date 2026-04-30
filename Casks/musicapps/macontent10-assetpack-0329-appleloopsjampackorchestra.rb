cask "macontent10-assetpack-0329-appleloopsjampackorchestra" do
  version "43b82bd0599b7f444ddec054fbeb2770"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0329_AppleLoopsJamPackOrchestra.pkg"
  name "MAContent10_AssetPack_0329_AppleLoopsJamPackOrchestra"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0329_AppleLoopsJamPackOrchestra.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0329_AppleLoopsJamPackOrchestra.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0329_AppleLoopsJamPackOrchestra"
end
