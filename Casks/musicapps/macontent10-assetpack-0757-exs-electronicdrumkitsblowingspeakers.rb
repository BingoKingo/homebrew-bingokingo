cask "macontent10-assetpack-0757-exs-electronicdrumkitsblowingspeakers" do
  version "cc01e8f37ce4106fc7ac1d15f7fa9302"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0757_EXS_ElectronicDrumkitsBlowingSpeakers.pkg"
  name "MAContent10_AssetPack_0757_EXS_ElectronicDrumkitsBlowingSpeakers"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0757_EXS_ElectronicDrumkitsBlowingSpeakers.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0757_EXS_ElectronicDrumkitsBlowingSpeakers.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0757_EXS_ElectronicDrumkitsBlowingSpeakers"
end
