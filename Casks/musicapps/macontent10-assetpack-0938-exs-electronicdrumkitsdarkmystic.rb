cask "macontent10-assetpack-0938-exs-electronicdrumkitsdarkmystic" do
  version "ea4686b2eb8bed4401cd09bf5aae748d-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0938_EXS_ElectronicDrumkitsDarkMystic.pkg"
  name "MAContent10_AssetPack_0938_EXS_ElectronicDrumkitsDarkMystic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0938_EXS_ElectronicDrumkitsDarkMystic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0938_EXS_ElectronicDrumkitsDarkMystic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0938_EXS_ElectronicDrumkitsDarkMystic"
end
