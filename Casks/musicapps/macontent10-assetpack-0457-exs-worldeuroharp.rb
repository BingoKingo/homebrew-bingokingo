cask "macontent10-assetpack-0457-exs-worldeuroharp" do
  version "252620305011c9937b21b1301a3769ce-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0457_EXS_WorldEuroHarp.pkg"
  name "MAContent10_AssetPack_0457_EXS_WorldEuroHarp"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0457_EXS_WorldEuroHarp.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0457_EXS_WorldEuroHarp.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0457_EXS_WorldEuroHarp"
end
