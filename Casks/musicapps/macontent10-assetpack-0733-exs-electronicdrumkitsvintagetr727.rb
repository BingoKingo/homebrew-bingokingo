cask "macontent10-assetpack-0733-exs-electronicdrumkitsvintagetr727" do
  version "5c844f541c082d0688b4073da898f0da"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0733_EXS_ElectronicDrumkitsVintageTR727.pkg"
  name "MAContent10_AssetPack_0733_EXS_ElectronicDrumkitsVintageTR727"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0733_EXS_ElectronicDrumkitsVintageTR727.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0733_EXS_ElectronicDrumkitsVintageTR727.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0733_EXS_ElectronicDrumkitsVintageTR727"
end
