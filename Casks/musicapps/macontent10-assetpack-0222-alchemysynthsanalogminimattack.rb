cask "macontent10-assetpack-0222-alchemysynthsanalogminimattack" do
  version "10fa520bd84d7c9e48c1525473e12ba7-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0222_AlchemySynthsAnalogMiniMAttack.pkg"
  name "MAContent10_AssetPack_0222_AlchemySynthsAnalogMiniMAttack"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0222_AlchemySynthsAnalogMiniMAttack.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0222_AlchemySynthsAnalogMiniMAttack.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0222_AlchemySynthsAnalogMiniMAttack"
end
