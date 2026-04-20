cask "macontent10-assetpack-0548-exs-iosinstruments" do
  version "73278eedf166ceaddcaedc06a1837bce-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0548_EXS_iOSInstruments.pkg"
  name "MAContent10_AssetPack_0548_EXS_iOSInstruments"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0548_EXS_iOSInstruments.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0548_EXS_iOSInstruments.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0548_EXS_iOSInstruments"
end
