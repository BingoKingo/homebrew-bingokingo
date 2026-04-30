cask "macontent10-assetpack-0682-exs-electronicdrumkitsminimalist" do
  version "cd051a6e2bd5e2db5a422bbe867f369d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0682_EXS_ElectronicDrumkitsMinimalist.pkg"
  name "MAContent10_AssetPack_0682_EXS_ElectronicDrumkitsMinimalist"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0682_EXS_ElectronicDrumkitsMinimalist.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0682_EXS_ElectronicDrumkitsMinimalist.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0682_EXS_ElectronicDrumkitsMinimalist"
end
