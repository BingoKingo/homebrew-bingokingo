cask "macontent10-assetpack-0088-alchemysoundscapesmisc" do
  version "026be84a95ee58f7e4f8f7ca5013704c-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0088_AlchemySoundscapesMisc.pkg"
  name "MAContent10_AssetPack_0088_AlchemySoundscapesMisc"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0088_AlchemySoundscapesMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0088_AlchemySoundscapesMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0088_AlchemySoundscapesMisc"
end
