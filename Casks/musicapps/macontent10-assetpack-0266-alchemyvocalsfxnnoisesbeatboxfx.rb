cask "macontent10-assetpack-0266-alchemyvocalsfxnnoisesbeatboxfx" do
  version "ff88c56985e92572c8128c8a16d305da-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0266_AlchemyVocalsFXNNoisesBeatBoxFX.pkg"
  name "MAContent10_AssetPack_0266_AlchemyVocalsFXNNoisesBeatBoxFX"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0266_AlchemyVocalsFXNNoisesBeatBoxFX.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0266_AlchemyVocalsFXNNoisesBeatBoxFX.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0266_AlchemyVocalsFXNNoisesBeatBoxFX"
end
