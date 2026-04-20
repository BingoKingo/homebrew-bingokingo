cask "macontent10-assetpack-0865-exs-electronicdrumkitswatchthesoundlinndrumtuneddown" do
  version "881f02b2fd957e04877946b720f730e7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0865_EXS_ElectronicDrumkitsWatchTheSoundLinnDrumTunedDown.pkg"
  name "MAContent10_AssetPack_0865_EXS_ElectronicDrumkitsWatchTheSoundLinnDrumTunedDown"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0865_EXS_ElectronicDrumkitsWatchTheSoundLinnDrumTunedDown.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0865_EXS_ElectronicDrumkitsWatchTheSoundLinnDrumTunedDown.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0865_EXS_ElectronicDrumkitsWatchTheSoundLinnDrumTunedDown"
end
