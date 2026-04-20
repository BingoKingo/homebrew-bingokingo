cask "macontent10-assetpack-0626-alchemysettingsvintagesynth" do
  version "8d377bc5f90f1cfbbd8ec0c927561c07"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0626_AlchemySettingsVintageSynth.pkg"
  name "MAContent10_AssetPack_0626_AlchemySettingsVintageSynth"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0626_AlchemySettingsVintageSynth.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0626_AlchemySettingsVintageSynth.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0626_AlchemySettingsVintageSynth"
end
