cask "macontent10-assetpack-0816-exs-electronicdrumkitshybridgrime" do
  version "3d4b8b8ee687763aeff0cfe0df81733f"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0816_EXS_ElectronicDrumkitsHybridGrime.pkg"
  name "MAContent10_AssetPack_0816_EXS_ElectronicDrumkitsHybridGrime"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0816_EXS_ElectronicDrumkitsHybridGrime.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0816_EXS_ElectronicDrumkitsHybridGrime.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0816_EXS_ElectronicDrumkitsHybridGrime"
end
