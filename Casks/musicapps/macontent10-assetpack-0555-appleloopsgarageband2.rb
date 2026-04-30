cask "macontent10-assetpack-0555-appleloopsgarageband2" do
  version "9ffe9496f3cb133fa97938a88e825a2f-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0555_AppleLoopsGarageBand2.pkg"
  name "MAContent10_AssetPack_0555_AppleLoopsGarageBand2"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0555_AppleLoopsGarageBand2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0555_AppleLoopsGarageBand2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0555_AppleLoopsGarageBand2"
end
