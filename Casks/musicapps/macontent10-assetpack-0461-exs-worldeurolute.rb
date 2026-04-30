cask "macontent10-assetpack-0461-exs-worldeurolute" do
  version "6bcbbbd42067c1b29a0d88f7e944fe95-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0461_EXS_WorldEuroLute.pkg"
  name "MAContent10_AssetPack_0461_EXS_WorldEuroLute"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0461_EXS_WorldEuroLute.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0461_EXS_WorldEuroLute.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0461_EXS_WorldEuroLute"
end
