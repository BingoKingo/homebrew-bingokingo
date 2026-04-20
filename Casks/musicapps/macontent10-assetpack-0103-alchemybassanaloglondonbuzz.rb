cask "macontent10-assetpack-0103-alchemybassanaloglondonbuzz" do
  version "475c8c55e44a241288cdc8f083197851"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0103_AlchemyBassAnalogLondonBuzz.pkg"
  name "MAContent10_AssetPack_0103_AlchemyBassAnalogLondonBuzz"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0103_AlchemyBassAnalogLondonBuzz.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0103_AlchemyBassAnalogLondonBuzz.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0103_AlchemyBassAnalogLondonBuzz"
end
