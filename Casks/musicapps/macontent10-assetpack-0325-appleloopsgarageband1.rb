cask "macontent10-assetpack-0325-appleloopsgarageband1" do
  version "676b44dc22b8c56203dc5b88598c22e1-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0325_AppleLoopsGarageBand1.pkg"
  name "MAContent10_AssetPack_0325_AppleLoopsGarageBand1"
  desc "ContainsAppleLoops, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0325_AppleLoopsGarageBand1.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0325_AppleLoopsGarageBand1.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0325_AppleLoopsGarageBand1"
end
