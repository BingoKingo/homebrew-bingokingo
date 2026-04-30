cask "macontent10-assetpack-0703-soundscapescustom" do
  version "db35eb87d9bdae12c53aed6aac9a9991-35"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0703_SoundscapesCustom.pkg"
  name "MAContent10_AssetPack_0703_SoundscapesCustom"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0703_SoundscapesCustom.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0703_SoundscapesCustom.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0703_SoundscapesCustom"
end
