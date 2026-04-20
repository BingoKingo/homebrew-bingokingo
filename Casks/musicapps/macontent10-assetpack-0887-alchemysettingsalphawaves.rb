cask "macontent10-assetpack-0887-alchemysettingsalphawaves" do
  version "21109d6d5caaa636f9be1eef2b403e95"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0887_AlchemySettingsAlphaWaves.pkg"
  name "MAContent10_AssetPack_0887_AlchemySettingsAlphaWaves"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0887_AlchemySettingsAlphaWaves.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0887_AlchemySettingsAlphaWaves.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0887_AlchemySettingsAlphaWaves"
end
