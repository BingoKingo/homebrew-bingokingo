cask "macontent10-assetpack-0672-exs-electronicdrumkitsbumper" do
  version "b3eb74db2952920fcdc277ab6652c99d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0672_EXS_ElectronicDrumkitsBumper.pkg"
  name "MAContent10_AssetPack_0672_EXS_ElectronicDrumkitsBumper"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0672_EXS_ElectronicDrumkitsBumper.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0672_EXS_ElectronicDrumkitsBumper.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0672_EXS_ElectronicDrumkitsBumper"
end
