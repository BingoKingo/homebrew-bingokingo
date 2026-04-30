cask "macontent10-assetpack-0131-alchemyguitarsacousticmisc" do
  version "cb1f1e5ea0606936408fc9dbbfd6917f-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0131_AlchemyGuitarsAcousticMisc.pkg"
  name "MAContent10_AssetPack_0131_AlchemyGuitarsAcousticMisc"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0131_AlchemyGuitarsAcousticMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0131_AlchemyGuitarsAcousticMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0131_AlchemyGuitarsAcousticMisc"
end
