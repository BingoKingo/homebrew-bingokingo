cask "macontent10-assetpack-0446-exs-worldasianchineseflute" do
  version "507793a3998b325956f5b03960b49347-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0446_EXS_WorldAsianChineseFlute.pkg"
  name "MAContent10_AssetPack_0446_EXS_WorldAsianChineseFlute"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0446_EXS_WorldAsianChineseFlute.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0446_EXS_WorldAsianChineseFlute.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0446_EXS_WorldAsianChineseFlute"
end
