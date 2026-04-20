cask "macontent10-assetpack-0078-alchemysoundscapesstrungnbow" do
  version "a45b32de26a13a3eae3a644b32b7cb52-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0078_AlchemySoundscapesStrungNBow.pkg"
  name "MAContent10_AssetPack_0078_AlchemySoundscapesStrungNBow"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0078_AlchemySoundscapesStrungNBow.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0078_AlchemySoundscapesStrungNBow.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0078_AlchemySoundscapesStrungNBow"
end
