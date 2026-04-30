cask "macontent10-assetpack-0718-exs-musicbox" do
  version "5daccfe41da135508c8e9b19a41c58da-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0718_EXS_MusicBox.pkg"
  name "MAContent10_AssetPack_0718_EXS_MusicBox"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0718_EXS_MusicBox.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0718_EXS_MusicBox.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0718_EXS_MusicBox"
end
