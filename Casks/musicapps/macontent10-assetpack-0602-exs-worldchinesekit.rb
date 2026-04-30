cask "macontent10-assetpack-0602-exs-worldchinesekit" do
  version "1496b20e1cea0e7bcbfbe9ffbb512929"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0602_EXS_WorldChineseKit.pkg"
  name "MAContent10_AssetPack_0602_EXS_WorldChineseKit"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0602_EXS_WorldChineseKit.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0602_EXS_WorldChineseKit.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0602_EXS_WorldChineseKit"
end
