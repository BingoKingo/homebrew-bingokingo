cask "macontent10-assetpack-0875-producerpacksettingsoakfelder" do
  version "55d6652130ca5b537e9acd95a02f218c"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0875_ProducerPackSettingsOakFelder.pkg"
  name "MAContent10_AssetPack_0875_ProducerPackSettingsOakFelder"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0875_ProducerPackSettingsOakFelder.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0875_ProducerPackSettingsOakFelder.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0875_ProducerPackSettingsOakFelder"
end
