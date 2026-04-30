cask "macontent10-assetpack-0292-alchemysoundeffectsinstruments" do
  version "40e4d41ccb642b08d29344be1ccd927d-15"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0292_AlchemySoundEffectsInstruments.pkg"
  name "MAContent10_AssetPack_0292_AlchemySoundEffectsInstruments"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0292_AlchemySoundEffectsInstruments.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0292_AlchemySoundEffectsInstruments.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0292_AlchemySoundEffectsInstruments"
end
