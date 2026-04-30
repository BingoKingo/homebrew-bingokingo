cask "macontent10-assetpack-0821-exs-electronicdrumkitsoverdrivebump" do
  version "ac85af8ff0d6a5ebaebada62b38b8c33"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0821_EXS_ElectronicDrumkitsOverdriveBump.pkg"
  name "MAContent10_AssetPack_0821_EXS_ElectronicDrumkitsOverdriveBump"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0821_EXS_ElectronicDrumkitsOverdriveBump.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0821_EXS_ElectronicDrumkitsOverdriveBump.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0821_EXS_ElectronicDrumkitsOverdriveBump"
end
