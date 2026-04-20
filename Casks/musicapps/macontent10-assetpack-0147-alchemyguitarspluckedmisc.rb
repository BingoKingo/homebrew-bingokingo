cask "macontent10-assetpack-0147-alchemyguitarspluckedmisc" do
  version "586445e6a7aadba5cfb97d601fb26bba-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0147_AlchemyGuitarsPluckedMisc.pkg"
  name "MAContent10_AssetPack_0147_AlchemyGuitarsPluckedMisc"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0147_AlchemyGuitarsPluckedMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0147_AlchemyGuitarsPluckedMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0147_AlchemyGuitarsPluckedMisc"
end
