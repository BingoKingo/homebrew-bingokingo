cask "macontent10-assetpack-0522-drummerliverpool" do
  version "457dac92861244076936ea82b205f078-38"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0522_DrummerLiverpool.pkg"
  name "MAContent10_AssetPack_0522_DrummerLiverpool"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0522_DrummerLiverpool.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0522_DrummerLiverpool.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0522_DrummerLiverpool"
end
