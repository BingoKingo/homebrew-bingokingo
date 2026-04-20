cask "macontent10-assetpack-0850-exs-electronicdrumkitssoulectionampedup" do
  version "7c8bc92fae63cc73f3fcc92a0d4c2ae3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0850_EXS_ElectronicDrumkitsSoulectionAmpedUp.pkg"
  name "MAContent10_AssetPack_0850_EXS_ElectronicDrumkitsSoulectionAmpedUp"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0850_EXS_ElectronicDrumkitsSoulectionAmpedUp.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0850_EXS_ElectronicDrumkitsSoulectionAmpedUp.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0850_EXS_ElectronicDrumkitsSoulectionAmpedUp"
end
