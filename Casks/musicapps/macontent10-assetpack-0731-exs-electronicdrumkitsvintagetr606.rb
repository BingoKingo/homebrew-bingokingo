cask "macontent10-assetpack-0731-exs-electronicdrumkitsvintagetr606" do
  version "774c992b6ebe867553a49d42c0b1a704"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0731_EXS_ElectronicDrumkitsVintageTR606.pkg"
  name "MAContent10_AssetPack_0731_EXS_ElectronicDrumkitsVintageTR606"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0731_EXS_ElectronicDrumkitsVintageTR606.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0731_EXS_ElectronicDrumkitsVintageTR606.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0731_EXS_ElectronicDrumkitsVintageTR606"
end
