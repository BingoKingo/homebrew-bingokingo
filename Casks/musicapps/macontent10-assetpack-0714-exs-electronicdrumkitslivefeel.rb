cask "macontent10-assetpack-0714-exs-electronicdrumkitslivefeel" do
  version "3e0ee077ebf37b1c60c6f9a5fa10b690"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0714_EXS_ElectronicDrumkitsLiveFeel.pkg"
  name "MAContent10_AssetPack_0714_EXS_ElectronicDrumkitsLiveFeel"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0714_EXS_ElectronicDrumkitsLiveFeel.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0714_EXS_ElectronicDrumkitsLiveFeel.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0714_EXS_ElectronicDrumkitsLiveFeel"
end
