cask "macontent10-assetpack-0813-exs-electronicdrumkitsdoingscience" do
  version "0c9b6a07ebbcb1b3aa7cb7b49d948f7d"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0813_EXS_ElectronicDrumkitsDoingScience.pkg"
  name "MAContent10_AssetPack_0813_EXS_ElectronicDrumkitsDoingScience"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0813_EXS_ElectronicDrumkitsDoingScience.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0813_EXS_ElectronicDrumkitsDoingScience.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0813_EXS_ElectronicDrumkitsDoingScience"
end
