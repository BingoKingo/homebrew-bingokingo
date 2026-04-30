cask "macontent10-assetpack-0750-exs-electronicdrumkitsnaturalbasshouse" do
  version "a57374f3e1d226ed407d406e95b2a765"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0750_EXS_ElectronicDrumkitsNaturalBassHouse.pkg"
  name "MAContent10_AssetPack_0750_EXS_ElectronicDrumkitsNaturalBassHouse"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0750_EXS_ElectronicDrumkitsNaturalBassHouse.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0750_EXS_ElectronicDrumkitsNaturalBassHouse.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0750_EXS_ElectronicDrumkitsNaturalBassHouse"
end
