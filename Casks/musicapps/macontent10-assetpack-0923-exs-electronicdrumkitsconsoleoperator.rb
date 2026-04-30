cask "macontent10-assetpack-0923-exs-electronicdrumkitsconsoleoperator" do
  version "73edf1715671bd61feadd4e88de29467"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0923_EXS_ElectronicDrumkitsConsoleOperator.pkg"
  name "MAContent10_AssetPack_0923_EXS_ElectronicDrumkitsConsoleOperator"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0923_EXS_ElectronicDrumkitsConsoleOperator.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0923_EXS_ElectronicDrumkitsConsoleOperator.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0923_EXS_ElectronicDrumkitsConsoleOperator"
end
