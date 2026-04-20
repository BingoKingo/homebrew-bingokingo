cask "macontent10-assetpack-1003-exs-electronicdrumkitspompompuckerpop" do
  version "6baabf201eaa22e9d0069b868543cb40"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1003_EXS_ElectronicDrumkitsPomPomPuckerPop.pkg"
  name "MAContent10_AssetPack_1003_EXS_ElectronicDrumkitsPomPomPuckerPop"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1003_EXS_ElectronicDrumkitsPomPomPuckerPop.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1003_EXS_ElectronicDrumkitsPomPomPuckerPop.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1003_EXS_ElectronicDrumkitsPomPomPuckerPop"
end
