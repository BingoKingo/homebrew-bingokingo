cask "macontent10-assetpack-0732-exs-electronicdrumkitsvintagetr707" do
  version "666cc068b56042b8512537ff67fc31cc"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0732_EXS_ElectronicDrumkitsVintageTR707.pkg"
  name "MAContent10_AssetPack_0732_EXS_ElectronicDrumkitsVintageTR707"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0732_EXS_ElectronicDrumkitsVintageTR707.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0732_EXS_ElectronicDrumkitsVintageTR707.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0732_EXS_ElectronicDrumkitsVintageTR707"
end
