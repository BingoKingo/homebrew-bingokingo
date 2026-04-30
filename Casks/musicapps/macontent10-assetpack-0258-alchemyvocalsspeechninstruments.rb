cask "macontent10-assetpack-0258-alchemyvocalsspeechninstruments" do
  version "3f2f4866f86f3fa2161caf430b3d5b3d-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0258_AlchemyVocalsSpeechNInstruments.pkg"
  name "MAContent10_AssetPack_0258_AlchemyVocalsSpeechNInstruments"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0258_AlchemyVocalsSpeechNInstruments.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0258_AlchemyVocalsSpeechNInstruments.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0258_AlchemyVocalsSpeechNInstruments"
end
