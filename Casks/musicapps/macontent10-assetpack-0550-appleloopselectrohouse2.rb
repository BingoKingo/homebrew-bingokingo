cask "macontent10-assetpack-0550-appleloopselectrohouse2" do
  version "8e7cbd6decef1ab337f40d32112b4ddd-21"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0550_AppleLoopsElectroHouse2.pkg"
  name "MAContent10_AssetPack_0550_AppleLoopsElectroHouse2"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0550_AppleLoopsElectroHouse2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0550_AppleLoopsElectroHouse2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0550_AppleLoopsElectroHouse2"
end
