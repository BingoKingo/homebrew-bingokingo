cask "macontent10-assetpack-0721-exs-xylokeyboard" do
  version "1170daab335723d3f4d0eb9824398cb4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0721_EXS_XyloKeyboard.pkg"
  name "MAContent10_AssetPack_0721_EXS_XyloKeyboard"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0721_EXS_XyloKeyboard.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0721_EXS_XyloKeyboard.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0721_EXS_XyloKeyboard"
end
