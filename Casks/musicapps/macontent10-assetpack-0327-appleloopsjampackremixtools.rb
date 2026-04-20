cask "macontent10-assetpack-0327-appleloopsjampackremixtools" do
  version "1c6df1b6323a07a503811dc451dd9d12"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0327_AppleLoopsJamPackRemixTools.pkg"
  name "MAContent10_AssetPack_0327_AppleLoopsJamPackRemixTools"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0327_AppleLoopsJamPackRemixTools.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0327_AppleLoopsJamPackRemixTools.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0327_AppleLoopsJamPackRemixTools"
end
