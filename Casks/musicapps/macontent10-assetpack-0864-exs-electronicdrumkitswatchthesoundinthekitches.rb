cask "macontent10-assetpack-0864-exs-electronicdrumkitswatchthesoundinthekitches" do
  version "74bafbc80be566a07f1bc3306b15dbfb"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0864_EXS_ElectronicDrumkitsWatchTheSoundInTheKitches.pkg"
  name "MAContent10_AssetPack_0864_EXS_ElectronicDrumkitsWatchTheSoundInTheKitches"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0864_EXS_ElectronicDrumkitsWatchTheSoundInTheKitches.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0864_EXS_ElectronicDrumkitsWatchTheSoundInTheKitches.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0864_EXS_ElectronicDrumkitsWatchTheSoundInTheKitches"
end
