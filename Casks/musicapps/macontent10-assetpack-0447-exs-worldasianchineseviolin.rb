cask "macontent10-assetpack-0447-exs-worldasianchineseviolin" do
  version "0322abccc464a4921f17f4e192b6fb5e-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0447_EXS_WorldAsianChineseViolin.pkg"
  name "MAContent10_AssetPack_0447_EXS_WorldAsianChineseViolin"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0447_EXS_WorldAsianChineseViolin.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0447_EXS_WorldAsianChineseViolin.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0447_EXS_WorldAsianChineseViolin"
end
