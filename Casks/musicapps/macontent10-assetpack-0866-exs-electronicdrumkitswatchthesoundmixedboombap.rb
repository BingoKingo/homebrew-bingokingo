cask "macontent10-assetpack-0866-exs-electronicdrumkitswatchthesoundmixedboombap" do
  version "689fa55aa0d8fcfd6a2274f37b979d5a"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0866_EXS_ElectronicDrumkitsWatchTheSoundMixedBoomBap.pkg"
  name "MAContent10_AssetPack_0866_EXS_ElectronicDrumkitsWatchTheSoundMixedBoomBap"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0866_EXS_ElectronicDrumkitsWatchTheSoundMixedBoomBap.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0866_EXS_ElectronicDrumkitsWatchTheSoundMixedBoomBap.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0866_EXS_ElectronicDrumkitsWatchTheSoundMixedBoomBap"
end
