cask "macontent10-assetpack-0524-drummermotownrevisited" do
  version "b09a082db87487ce560f655ccc0bda26-44"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0524_DrummerMotownRevisited.pkg"
  name "MAContent10_AssetPack_0524_DrummerMotownRevisited"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0524_DrummerMotownRevisited.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0524_DrummerMotownRevisited.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0524_DrummerMotownRevisited"
end
