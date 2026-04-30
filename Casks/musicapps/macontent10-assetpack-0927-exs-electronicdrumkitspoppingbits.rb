cask "macontent10-assetpack-0927-exs-electronicdrumkitspoppingbits" do
  version "68a5f3abead98dfcee365b82c3ec7cc3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0927_EXS_ElectronicDrumkitsPoppingBits.pkg"
  name "MAContent10_AssetPack_0927_EXS_ElectronicDrumkitsPoppingBits"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0927_EXS_ElectronicDrumkitsPoppingBits.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0927_EXS_ElectronicDrumkitsPoppingBits.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0927_EXS_ElectronicDrumkitsPoppingBits"
end
