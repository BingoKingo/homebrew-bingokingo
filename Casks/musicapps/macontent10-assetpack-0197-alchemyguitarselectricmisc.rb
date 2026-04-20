cask "macontent10-assetpack-0197-alchemyguitarselectricmisc" do
  version "276b694093b2f542350f4eebc351a58a-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0197_AlchemyGuitarsElectricMisc.pkg"
  name "MAContent10_AssetPack_0197_AlchemyGuitarsElectricMisc"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0197_AlchemyGuitarsElectricMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0197_AlchemyGuitarsElectricMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0197_AlchemyGuitarsElectricMisc"
end
