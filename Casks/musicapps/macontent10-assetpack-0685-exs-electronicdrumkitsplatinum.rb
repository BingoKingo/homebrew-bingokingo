cask "macontent10-assetpack-0685-exs-electronicdrumkitsplatinum" do
  version "99d7e56b3f862f253d4f029f2d2ed68b"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0685_EXS_ElectronicDrumkitsPlatinum.pkg"
  name "MAContent10_AssetPack_0685_EXS_ElectronicDrumkitsPlatinum"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0685_EXS_ElectronicDrumkitsPlatinum.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0685_EXS_ElectronicDrumkitsPlatinum.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0685_EXS_ElectronicDrumkitsPlatinum"
end
