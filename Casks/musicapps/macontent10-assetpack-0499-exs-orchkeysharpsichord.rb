cask "macontent10-assetpack-0499-exs-orchkeysharpsichord" do
  version "55eb1cf7109480d52bb51ce57fa02d12-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0499_EXS_OrchKeysHarpsichord.pkg"
  name "MAContent10_AssetPack_0499_EXS_OrchKeysHarpsichord"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0499_EXS_OrchKeysHarpsichord.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0499_EXS_OrchKeysHarpsichord.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0499_EXS_OrchKeysHarpsichord"
end
