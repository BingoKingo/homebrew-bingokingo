cask "macontent10-assetpack-0710-alchemyrhythmiccustomsynthcustom" do
  version "784c7fcd6551f82a7d05e76847623452"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0710_AlchemyRhythmicCustomSynthCustom.pkg"
  name "MAContent10_AssetPack_0710_AlchemyRhythmicCustomSynthCustom"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0710_AlchemyRhythmicCustomSynthCustom.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0710_AlchemyRhythmicCustomSynthCustom.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0710_AlchemyRhythmicCustomSynthCustom"
end
