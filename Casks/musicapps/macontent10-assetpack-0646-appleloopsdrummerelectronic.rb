cask "macontent10-assetpack-0646-appleloopsdrummerelectronic" do
  version "8c4cef9ff45039395cf36df232b79ce8-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0646_AppleLoopsDrummerElectronic.pkg"
  name "MAContent10_AssetPack_0646_AppleLoopsDrummerElectronic"
  desc "ContainsAppleLoops, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0646_AppleLoopsDrummerElectronic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0646_AppleLoopsDrummerElectronic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0646_AppleLoopsDrummerElectronic"
end
