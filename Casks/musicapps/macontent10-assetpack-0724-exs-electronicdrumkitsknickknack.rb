cask "macontent10-assetpack-0724-exs-electronicdrumkitsknickknack" do
  version "4c61296aa40014151ce5d2e10ac732d0"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0724_EXS_ElectronicDrumkitsKnickKnack.pkg"
  name "MAContent10_AssetPack_0724_EXS_ElectronicDrumkitsKnickKnack"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0724_EXS_ElectronicDrumkitsKnickKnack.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0724_EXS_ElectronicDrumkitsKnickKnack.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0724_EXS_ElectronicDrumkitsKnickKnack"
end
