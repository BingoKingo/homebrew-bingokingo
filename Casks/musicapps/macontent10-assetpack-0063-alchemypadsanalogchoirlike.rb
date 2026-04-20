cask "macontent10-assetpack-0063-alchemypadsanalogchoirlike" do
  version "8d6e6c15607601c56aef14fa187d501c-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0063_AlchemyPadsAnalogChoirLike.pkg"
  name "MAContent10_AssetPack_0063_AlchemyPadsAnalogChoirLike"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0063_AlchemyPadsAnalogChoirLike.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0063_AlchemyPadsAnalogChoirLike.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0063_AlchemyPadsAnalogChoirLike"
end
