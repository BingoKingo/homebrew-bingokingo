cask "macontent10-assetpack-0807-exs-electronicdrumkitsaboveandbeyond" do
  version "f47169a44012e322dd07a05f073dc5c5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0807_EXS_ElectronicDrumkitsAboveAndBeyond.pkg"
  name "MAContent10_AssetPack_0807_EXS_ElectronicDrumkitsAboveAndBeyond"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0807_EXS_ElectronicDrumkitsAboveAndBeyond.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0807_EXS_ElectronicDrumkitsAboveAndBeyond.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0807_EXS_ElectronicDrumkitsAboveAndBeyond"
end
