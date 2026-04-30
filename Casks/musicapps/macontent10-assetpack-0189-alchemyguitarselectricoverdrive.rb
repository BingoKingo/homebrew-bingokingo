cask "macontent10-assetpack-0189-alchemyguitarselectricoverdrive" do
  version "f895e3a1da4dc82e744eb464e6613875-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0189_AlchemyGuitarsElectricOverdrive.pkg"
  name "MAContent10_AssetPack_0189_AlchemyGuitarsElectricOverdrive"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0189_AlchemyGuitarsElectricOverdrive.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0189_AlchemyGuitarsElectricOverdrive.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0189_AlchemyGuitarsElectricOverdrive"
end
