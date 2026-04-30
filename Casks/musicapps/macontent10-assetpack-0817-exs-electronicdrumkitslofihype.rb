cask "macontent10-assetpack-0817-exs-electronicdrumkitslofihype" do
  version "8d25c8ec5885e2fb1ed8b35ba898c8aa"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0817_EXS_ElectronicDrumkitsLoFiHype.pkg"
  name "MAContent10_AssetPack_0817_EXS_ElectronicDrumkitsLoFiHype"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0817_EXS_ElectronicDrumkitsLoFiHype.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0817_EXS_ElectronicDrumkitsLoFiHype.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0817_EXS_ElectronicDrumkitsLoFiHype"
end
