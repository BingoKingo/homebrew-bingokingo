cask "macontent10-assetpack-0926-exs-electronicdrumkitsoldschool8bit" do
  version "2b9b324de6b33958e820cb026e63430d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0926_EXS_ElectronicDrumkitsOldSchool8Bit.pkg"
  name "MAContent10_AssetPack_0926_EXS_ElectronicDrumkitsOldSchool8Bit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0926_EXS_ElectronicDrumkitsOldSchool8Bit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0926_EXS_ElectronicDrumkitsOldSchool8Bit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0926_EXS_ElectronicDrumkitsOldSchool8Bit"
end
