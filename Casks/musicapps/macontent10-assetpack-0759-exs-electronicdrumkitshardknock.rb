cask "macontent10-assetpack-0759-exs-electronicdrumkitshardknock" do
  version "83db061c64e721ec17b97eda316c522a"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0759_EXS_ElectronicDrumkitsHardKnock.pkg"
  name "MAContent10_AssetPack_0759_EXS_ElectronicDrumkitsHardKnock"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0759_EXS_ElectronicDrumkitsHardKnock.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0759_EXS_ElectronicDrumkitsHardKnock.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0759_EXS_ElectronicDrumkitsHardKnock"
end
