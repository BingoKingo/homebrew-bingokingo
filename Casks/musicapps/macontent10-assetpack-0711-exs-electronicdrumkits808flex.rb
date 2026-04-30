cask "macontent10-assetpack-0711-exs-electronicdrumkits808flex" do
  version "be3d0c5727839cc18000f4030e8b5852"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0711_EXS_ElectronicDrumkits808Flex.pkg"
  name "MAContent10_AssetPack_0711_EXS_ElectronicDrumkits808Flex"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0711_EXS_ElectronicDrumkits808Flex.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0711_EXS_ElectronicDrumkits808Flex.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0711_EXS_ElectronicDrumkits808Flex"
end
