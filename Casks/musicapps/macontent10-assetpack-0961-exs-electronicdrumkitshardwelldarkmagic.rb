cask "macontent10-assetpack-0961-exs-electronicdrumkitshardwelldarkmagic" do
  version "b121863c05867443a2af16647c8f47ce"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0961_EXS_ElectronicDrumkitsHardwellDarkMagic.pkg"
  name "MAContent10_AssetPack_0961_EXS_ElectronicDrumkitsHardwellDarkMagic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0961_EXS_ElectronicDrumkitsHardwellDarkMagic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0961_EXS_ElectronicDrumkitsHardwellDarkMagic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0961_EXS_ElectronicDrumkitsHardwellDarkMagic"
end
