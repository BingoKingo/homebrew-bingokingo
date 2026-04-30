cask "macontent10-assetpack-0287-alchemysoundeffectstransitionsncustom" do
  version "4e2cebb8459d7a0c0009e165952bc49d-11"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0287_AlchemySoundEffectsTransitionsNCustom.pkg"
  name "MAContent10_AssetPack_0287_AlchemySoundEffectsTransitionsNCustom"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0287_AlchemySoundEffectsTransitionsNCustom.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0287_AlchemySoundEffectsTransitionsNCustom.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0287_AlchemySoundEffectsTransitionsNCustom"
end
