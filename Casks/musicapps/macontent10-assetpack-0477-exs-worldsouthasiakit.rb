cask "macontent10-assetpack-0477-exs-worldsouthasiakit" do
  version "ec3a6582b50cf28717a4a468268f4a3f-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0477_EXS_WorldSouthAsiaKit.pkg"
  name "MAContent10_AssetPack_0477_EXS_WorldSouthAsiaKit"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0477_EXS_WorldSouthAsiaKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0477_EXS_WorldSouthAsiaKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0477_EXS_WorldSouthAsiaKit"
end
