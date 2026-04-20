cask "macontent10-assetpack-0051-alchemypadsdigitaldreamstealer" do
  version "e42c42de56efc2d1a6615f0c6ac6e8c8-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0051_AlchemyPadsDigitalDreamstealer.pkg"
  name "MAContent10_AssetPack_0051_AlchemyPadsDigitalDreamstealer"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0051_AlchemyPadsDigitalDreamstealer.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0051_AlchemyPadsDigitalDreamstealer.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0051_AlchemyPadsDigitalDreamstealer"
end
