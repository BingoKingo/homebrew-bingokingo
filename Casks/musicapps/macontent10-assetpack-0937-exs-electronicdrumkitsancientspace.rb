cask "macontent10-assetpack-0937-exs-electronicdrumkitsancientspace" do
  version "ef325f08bd24ec7d827e8bfd47b290e4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0937_EXS_ElectronicDrumkitsAncientSpace.pkg"
  name "MAContent10_AssetPack_0937_EXS_ElectronicDrumkitsAncientSpace"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0937_EXS_ElectronicDrumkitsAncientSpace.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0937_EXS_ElectronicDrumkitsAncientSpace.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0937_EXS_ElectronicDrumkitsAncientSpace"
end
