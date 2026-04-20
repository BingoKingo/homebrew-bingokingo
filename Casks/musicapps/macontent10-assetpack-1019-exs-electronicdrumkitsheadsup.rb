cask "macontent10-assetpack-1019-exs-electronicdrumkitsheadsup" do
  version "d12224554521a27c1057aab577c3f666"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1019_EXS_ElectronicDrumkitsHeadsUp.pkg"
  name "MAContent10_AssetPack_1019_EXS_ElectronicDrumkitsHeadsUp"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1019_EXS_ElectronicDrumkitsHeadsUp.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1019_EXS_ElectronicDrumkitsHeadsUp.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1019_EXS_ElectronicDrumkitsHeadsUp"
end
