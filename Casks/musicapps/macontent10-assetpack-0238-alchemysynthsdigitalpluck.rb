cask "macontent10-assetpack-0238-alchemysynthsdigitalpluck" do
  version "55507261b7cc24d2c5461148f908a843-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0238_AlchemySynthsDigitalPluck.pkg"
  name "MAContent10_AssetPack_0238_AlchemySynthsDigitalPluck"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0238_AlchemySynthsDigitalPluck.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0238_AlchemySynthsDigitalPluck.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0238_AlchemySynthsDigitalPluck"
end
