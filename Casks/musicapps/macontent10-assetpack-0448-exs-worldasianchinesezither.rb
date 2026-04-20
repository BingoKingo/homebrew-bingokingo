cask "macontent10-assetpack-0448-exs-worldasianchinesezither" do
  version "3db7eadb4abac87147eec128986f24ad-16"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0448_EXS_WorldAsianChineseZither.pkg"
  name "MAContent10_AssetPack_0448_EXS_WorldAsianChineseZither"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0448_EXS_WorldAsianChineseZither.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0448_EXS_WorldAsianChineseZither.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0448_EXS_WorldAsianChineseZither"
end
