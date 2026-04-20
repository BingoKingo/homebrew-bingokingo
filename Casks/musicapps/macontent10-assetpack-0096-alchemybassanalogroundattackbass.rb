cask "macontent10-assetpack-0096-alchemybassanalogroundattackbass" do
  version "0175e8c75bf8d82b4e1b1a099c563465"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0096_AlchemyBassAnalogRoundAttackBass.pkg"
  name "MAContent10_AssetPack_0096_AlchemyBassAnalogRoundAttackBass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0096_AlchemyBassAnalogRoundAttackBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0096_AlchemyBassAnalogRoundAttackBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0096_AlchemyBassAnalogRoundAttackBass"
end
