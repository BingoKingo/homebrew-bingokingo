cask "macontent10-assetpack-0450-exs-worldasianchineseflute" do
  version "0a182d912079af7f7611b827a9d8a8ca-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0450_EXS_WorldAsianChineseFlute.pkg"
  name "MAContent10_AssetPack_0450_EXS_WorldAsianChineseFlute"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0450_EXS_WorldAsianChineseFlute.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0450_EXS_WorldAsianChineseFlute.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0450_EXS_WorldAsianChineseFlute"
end
