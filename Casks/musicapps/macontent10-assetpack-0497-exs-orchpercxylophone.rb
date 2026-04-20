cask "macontent10-assetpack-0497-exs-orchpercxylophone" do
  version "aba98dd60dabd1e4fef00f6c8d9bd880"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0497_EXS_OrchPercXylophone.pkg"
  name "MAContent10_AssetPack_0497_EXS_OrchPercXylophone"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0497_EXS_OrchPercXylophone.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0497_EXS_OrchPercXylophone.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0497_EXS_OrchPercXylophone"
end
