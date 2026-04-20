cask "macontent10-assetpack-0076-alchemysoundscapesartefact" do
  version "24c985ad939229716156ada1984ebcd3-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0076_AlchemySoundscapesArtefact.pkg"
  name "MAContent10_AssetPack_0076_AlchemySoundscapesArtefact"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0076_AlchemySoundscapesArtefact.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0076_AlchemySoundscapesArtefact.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0076_AlchemySoundscapesArtefact"
end
