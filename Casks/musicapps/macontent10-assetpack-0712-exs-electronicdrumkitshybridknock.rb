cask "macontent10-assetpack-0712-exs-electronicdrumkitshybridknock" do
  version "d87ac8067ca0bc8f2014d9871ac6b420"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0712_EXS_ElectronicDrumkitsHybridKnock.pkg"
  name "MAContent10_AssetPack_0712_EXS_ElectronicDrumkitsHybridKnock"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0712_EXS_ElectronicDrumkitsHybridKnock.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0712_EXS_ElectronicDrumkitsHybridKnock.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0712_EXS_ElectronicDrumkitsHybridKnock"
end
