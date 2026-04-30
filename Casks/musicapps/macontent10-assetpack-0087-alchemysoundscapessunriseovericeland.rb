cask "macontent10-assetpack-0087-alchemysoundscapessunriseovericeland" do
  version "69217c1708e17a682c7024e57fa08e70-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0087_AlchemySoundscapesSunriseOverIceland.pkg"
  name "MAContent10_AssetPack_0087_AlchemySoundscapesSunriseOverIceland"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0087_AlchemySoundscapesSunriseOverIceland.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0087_AlchemySoundscapesSunriseOverIceland.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0087_AlchemySoundscapesSunriseOverIceland"
end
