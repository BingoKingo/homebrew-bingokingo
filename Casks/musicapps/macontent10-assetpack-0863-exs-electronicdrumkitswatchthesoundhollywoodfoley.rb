cask "macontent10-assetpack-0863-exs-electronicdrumkitswatchthesoundhollywoodfoley" do
  version "05749a92aa80df20817e830280238b55-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0863_EXS_ElectronicDrumkitsWatchTheSoundHollywoodFoley.pkg"
  name "MAContent10_AssetPack_0863_EXS_ElectronicDrumkitsWatchTheSoundHollywoodFoley"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0863_EXS_ElectronicDrumkitsWatchTheSoundHollywoodFoley.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0863_EXS_ElectronicDrumkitsWatchTheSoundHollywoodFoley.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0863_EXS_ElectronicDrumkitsWatchTheSoundHollywoodFoley"
end
