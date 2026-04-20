cask "macontent10-assetpack-0819-exs-electronicdrumkitsmodernknock" do
  version "7272318cda070fbe4bee57fb2e229cb6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0819_EXS_ElectronicDrumkitsModernKnock.pkg"
  name "MAContent10_AssetPack_0819_EXS_ElectronicDrumkitsModernKnock"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0819_EXS_ElectronicDrumkitsModernKnock.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0819_EXS_ElectronicDrumkitsModernKnock.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0819_EXS_ElectronicDrumkitsModernKnock"
end
