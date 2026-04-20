cask "macontent10-assetpack-0280-alchemyvocalssolovocalsmorphscherry" do
  version "4fca09fe94d2dcd3e3e1d26bc8d2d4a5-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0280_AlchemyVocalsSoloVocalsMorphsCherry.pkg"
  name "MAContent10_AssetPack_0280_AlchemyVocalsSoloVocalsMorphsCherry"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0280_AlchemyVocalsSoloVocalsMorphsCherry.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0280_AlchemyVocalsSoloVocalsMorphsCherry.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0280_AlchemyVocalsSoloVocalsMorphsCherry"
end
