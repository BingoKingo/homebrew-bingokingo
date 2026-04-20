cask "macontent10-assetpack-0478-exs-worldsouthasiaflute" do
  version "a3bbe1babf5310380c044867d840970f-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0478_EXS_WorldSouthAsiaFlute.pkg"
  name "MAContent10_AssetPack_0478_EXS_WorldSouthAsiaFlute"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0478_EXS_WorldSouthAsiaFlute.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0478_EXS_WorldSouthAsiaFlute.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0478_EXS_WorldSouthAsiaFlute"
end
