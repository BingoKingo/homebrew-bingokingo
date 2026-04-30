cask "macontent10-assetpack-0614-alchemysettingsvintagesynth" do
  version "68b1f8930e75f99054f14f19e2f50958"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0614_AlchemySettingsVintageSynth.pkg"
  name "MAContent10_AssetPack_0614_AlchemySettingsVintageSynth"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0614_AlchemySettingsVintageSynth.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0614_AlchemySettingsVintageSynth.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0614_AlchemySettingsVintageSynth"
end
