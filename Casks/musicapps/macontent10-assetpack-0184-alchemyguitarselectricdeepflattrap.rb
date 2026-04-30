cask "macontent10-assetpack-0184-alchemyguitarselectricdeepflattrap" do
  version "d7d3a9a1dacbcc7f5ebc6ca971f12559"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0184_AlchemyGuitarsElectricDeepFlatTrap.pkg"
  name "MAContent10_AssetPack_0184_AlchemyGuitarsElectricDeepFlatTrap"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0184_AlchemyGuitarsElectricDeepFlatTrap.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0184_AlchemyGuitarsElectricDeepFlatTrap.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0184_AlchemyGuitarsElectricDeepFlatTrap"
end
