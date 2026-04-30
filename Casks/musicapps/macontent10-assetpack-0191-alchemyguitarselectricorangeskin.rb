cask "macontent10-assetpack-0191-alchemyguitarselectricorangeskin" do
  version "dcff4b210eec627b944894c7a3911958-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0191_AlchemyGuitarsElectricOrangeSkin.pkg"
  name "MAContent10_AssetPack_0191_AlchemyGuitarsElectricOrangeSkin"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0191_AlchemyGuitarsElectricOrangeSkin.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0191_AlchemyGuitarsElectricOrangeSkin.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0191_AlchemyGuitarsElectricOrangeSkin"
end
