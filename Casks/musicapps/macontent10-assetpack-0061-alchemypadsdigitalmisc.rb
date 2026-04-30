cask "macontent10-assetpack-0061-alchemypadsdigitalmisc" do
  version "8f1b8bb01b025293ebd2d03b9af9d6c0-19"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0061_AlchemyPadsDigitalMisc.pkg"
  name "MAContent10_AssetPack_0061_AlchemyPadsDigitalMisc"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0061_AlchemyPadsDigitalMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0061_AlchemyPadsDigitalMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0061_AlchemyPadsDigitalMisc"
end
