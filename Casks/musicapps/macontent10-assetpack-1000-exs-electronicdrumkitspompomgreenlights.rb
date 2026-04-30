cask "macontent10-assetpack-1000-exs-electronicdrumkitspompomgreenlights" do
  version "e980e7d03db188a3ece0b16d1114ac1c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1000_EXS_ElectronicDrumkitsPomPomGreenLights.pkg"
  name "MAContent10_AssetPack_1000_EXS_ElectronicDrumkitsPomPomGreenLights"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_1000_EXS_ElectronicDrumkitsPomPomGreenLights.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_1000_EXS_ElectronicDrumkitsPomPomGreenLights.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_1000_EXS_ElectronicDrumkitsPomPomGreenLights"
end
