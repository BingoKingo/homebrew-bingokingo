cask "macontent10-assetpack-0484-exs-orchwoodwindclarinetsolo" do
  version "08de29c2a4933e8d2e09be8db2c54b57-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0484_EXS_OrchWoodwindClarinetSolo.pkg"
  name "MAContent10_AssetPack_0484_EXS_OrchWoodwindClarinetSolo"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0484_EXS_OrchWoodwindClarinetSolo.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0484_EXS_OrchWoodwindClarinetSolo.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0484_EXS_OrchWoodwindClarinetSolo"
end
