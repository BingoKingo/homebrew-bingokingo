cask "macontent10-assetpack-0809-exs-electronicdrumkitsabsolutezero" do
  version "f9e88036d7d419a15ab1e06be85aa865"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0809_EXS_ElectronicDrumkitsAbsoluteZero.pkg"
  name "MAContent10_AssetPack_0809_EXS_ElectronicDrumkitsAbsoluteZero"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0809_EXS_ElectronicDrumkitsAbsoluteZero.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0809_EXS_ElectronicDrumkitsAbsoluteZero.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0809_EXS_ElectronicDrumkitsAbsoluteZero"
end
