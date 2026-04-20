cask "macontent10-assetpack-0460-exs-worldeurobouzouki" do
  version "56de7a1e4f119452b1e3148e4b0c711b-11"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0460_EXS_WorldEuroBouzouki.pkg"
  name "MAContent10_AssetPack_0460_EXS_WorldEuroBouzouki"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0460_EXS_WorldEuroBouzouki.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0460_EXS_WorldEuroBouzouki.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0460_EXS_WorldEuroBouzouki"
end
