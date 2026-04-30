cask "macontent10-assetpack-0738-appleloopsgarageband3" do
  version "85f53ae1542476f5f4c1443083b681da-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0738_AppleLoopsGarageBand3.pkg"
  name "MAContent10_AssetPack_0738_AppleLoopsGarageBand3"
  desc "ContainsAppleLoops, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0738_AppleLoopsGarageBand3.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0738_AppleLoopsGarageBand3.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0738_AppleLoopsGarageBand3"
end
