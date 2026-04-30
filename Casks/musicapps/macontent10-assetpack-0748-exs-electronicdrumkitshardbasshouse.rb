cask "macontent10-assetpack-0748-exs-electronicdrumkitshardbasshouse" do
  version "1ec439c9ffd46babb804a153e2968668"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0748_EXS_ElectronicDrumkitsHardBassHouse.pkg"
  name "MAContent10_AssetPack_0748_EXS_ElectronicDrumkitsHardBassHouse"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0748_EXS_ElectronicDrumkitsHardBassHouse.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0748_EXS_ElectronicDrumkitsHardBassHouse.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0748_EXS_ElectronicDrumkitsHardBassHouse"
end
