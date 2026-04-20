cask "macontent10-assetpack-0315-appleloopselectrohouse1" do
  version "b993183f8023a867bc547637b249c918-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0315_AppleLoopsElectroHouse1.pkg"
  name "MAContent10_AssetPack_0315_AppleLoopsElectroHouse1"
  desc "ContainsAppleLoops, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0315_AppleLoopsElectroHouse1.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0315_AppleLoopsElectroHouse1.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0315_AppleLoopsElectroHouse1"
end
