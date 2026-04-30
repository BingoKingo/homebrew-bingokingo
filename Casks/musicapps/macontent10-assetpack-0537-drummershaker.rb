cask "macontent10-assetpack-0537-drummershaker" do
  version "9cfe25992fba74afc8875f2252ea45d2-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0537_DrummerShaker.pkg"
  name "MAContent10_AssetPack_0537_DrummerShaker"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0537_DrummerShaker.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0537_DrummerShaker.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0537_DrummerShaker"
end
