cask "macontent10-assetpack-1002-exs-electronicdrumkitspompomphantomskit" do
  version "ab9128a9d2ac420955d321ff4aab2b16"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1002_EXS_ElectronicDrumkitsPomPomPhantomsKit.pkg"
  name "MAContent10_AssetPack_1002_EXS_ElectronicDrumkitsPomPomPhantomsKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1002_EXS_ElectronicDrumkitsPomPomPhantomsKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1002_EXS_ElectronicDrumkitsPomPomPhantomsKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1002_EXS_ElectronicDrumkitsPomPomPhantomsKit"
end
