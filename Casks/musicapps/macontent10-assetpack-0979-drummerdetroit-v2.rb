cask "macontent10-assetpack-0979-drummerdetroit-v2" do
  version "01552ce493ec5754786ed22415df3899-22"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0979_DrummerDetroit_v2.pkg"
  name "MAContent10_AssetPack_0979_DrummerDetroit_v2"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0979_DrummerDetroit_v2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0979_DrummerDetroit_v2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0979_DrummerDetroit_v2"
end
