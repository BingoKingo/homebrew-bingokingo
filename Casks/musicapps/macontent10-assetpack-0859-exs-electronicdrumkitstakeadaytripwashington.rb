cask "macontent10-assetpack-0859-exs-electronicdrumkitstakeadaytripwashington" do
  version "b4fff2f3b797eabc6169f818578ded07"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0859_EXS_ElectronicDrumkitsTakeADaytripWashington.pkg"
  name "MAContent10_AssetPack_0859_EXS_ElectronicDrumkitsTakeADaytripWashington"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0859_EXS_ElectronicDrumkitsTakeADaytripWashington.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0859_EXS_ElectronicDrumkitsTakeADaytripWashington.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0859_EXS_ElectronicDrumkitsTakeADaytripWashington"
end
