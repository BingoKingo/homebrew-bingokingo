cask "macontent10-assetpack-0465-exs-worldeurometaldrumslap" do
  version "1317dc6effc8b1036e67e5bae6fb046c-21"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0465_EXS_WorldEuroMetalDrumSlap.pkg"
  name "MAContent10_AssetPack_0465_EXS_WorldEuroMetalDrumSlap"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0465_EXS_WorldEuroMetalDrumSlap.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0465_EXS_WorldEuroMetalDrumSlap.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0465_EXS_WorldEuroMetalDrumSlap"
end
