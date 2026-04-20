cask "macontent10-assetpack-0114-alchemybassdigitalwbass" do
  version "fb6257eb33c28c25aec5635f66f09f92-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0114_AlchemyBassDigitalWBass.pkg"
  name "MAContent10_AssetPack_0114_AlchemyBassDigitalWBass"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0114_AlchemyBassDigitalWBass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0114_AlchemyBassDigitalWBass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0114_AlchemyBassDigitalWBass"
end
