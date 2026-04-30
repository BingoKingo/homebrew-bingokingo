cask "macontent10-assetpack-0074-alchemysoundscapesjungleghosts" do
  version "ecbf3c2037273257055fe51526d47a29-6"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0074_AlchemySoundscapesJungleGhosts.pkg"
  name "MAContent10_AssetPack_0074_AlchemySoundscapesJungleGhosts"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0074_AlchemySoundscapesJungleGhosts.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0074_AlchemySoundscapesJungleGhosts.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0074_AlchemySoundscapesJungleGhosts"
end
