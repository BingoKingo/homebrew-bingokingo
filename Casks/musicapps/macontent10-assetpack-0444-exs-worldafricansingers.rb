cask "macontent10-assetpack-0444-exs-worldafricansingers" do
  version "de26e63d9d878acab0edcf8bd9ff31a8-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0444_EXS_WorldAfricanSingers.pkg"
  name "MAContent10_AssetPack_0444_EXS_WorldAfricanSingers"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0444_EXS_WorldAfricanSingers.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0444_EXS_WorldAfricanSingers.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0444_EXS_WorldAfricanSingers"
end
