cask "macontent10-assetpack-0862-exs-electronicdrumkitswatchthesoundcr78madeiconic" do
  version "517b986330be9ba272b7bb7e5855ea0a"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0862_EXS_ElectronicDrumkitsWatchTheSoundCR78MadeIconic.pkg"
  name "MAContent10_AssetPack_0862_EXS_ElectronicDrumkitsWatchTheSoundCR78MadeIconic"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0862_EXS_ElectronicDrumkitsWatchTheSoundCR78MadeIconic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0862_EXS_ElectronicDrumkitsWatchTheSoundCR78MadeIconic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0862_EXS_ElectronicDrumkitsWatchTheSoundCR78MadeIconic"
end
