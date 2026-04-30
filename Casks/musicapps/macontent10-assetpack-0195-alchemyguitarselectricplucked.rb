cask "macontent10-assetpack-0195-alchemyguitarselectricplucked" do
  version "364695f46a3671a18a3706703c40e253-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0195_AlchemyGuitarsElectricPlucked.pkg"
  name "MAContent10_AssetPack_0195_AlchemyGuitarsElectricPlucked"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0195_AlchemyGuitarsElectricPlucked.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0195_AlchemyGuitarsElectricPlucked.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0195_AlchemyGuitarsElectricPlucked"
end
