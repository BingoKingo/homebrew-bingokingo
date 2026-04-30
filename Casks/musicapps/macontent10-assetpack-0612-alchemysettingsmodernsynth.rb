cask "macontent10-assetpack-0612-alchemysettingsmodernsynth" do
  version "59c3d722e5e40882d584df260cf433ae"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0612_AlchemySettingsModernSynth.pkg"
  name "MAContent10_AssetPack_0612_AlchemySettingsModernSynth"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0612_AlchemySettingsModernSynth.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0612_AlchemySettingsModernSynth.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0612_AlchemySettingsModernSynth"
end
