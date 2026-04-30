cask "macontent10-assetpack-0729-exs-electronicdrumkitsvintagecr78" do
  version "9b78057c6e901bb21bb405e7580e2235"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0729_EXS_ElectronicDrumkitsVintageCR78.pkg"
  name "MAContent10_AssetPack_0729_EXS_ElectronicDrumkitsVintageCR78"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0729_EXS_ElectronicDrumkitsVintageCR78.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0729_EXS_ElectronicDrumkitsVintageCR78.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0729_EXS_ElectronicDrumkitsVintageCR78"
end
