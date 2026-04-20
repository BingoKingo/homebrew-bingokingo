cask "macontent10-assetpack-0962-exs-electronicdrumkitshardwellhardwired" do
  version "3014c322089f2e45613888e635ee7a28"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0962_EXS_ElectronicDrumkitsHardwellHardwired.pkg"
  name "MAContent10_AssetPack_0962_EXS_ElectronicDrumkitsHardwellHardwired"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0962_EXS_ElectronicDrumkitsHardwellHardwired.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0962_EXS_ElectronicDrumkitsHardwellHardwired.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0962_EXS_ElectronicDrumkitsHardwellHardwired"
end
