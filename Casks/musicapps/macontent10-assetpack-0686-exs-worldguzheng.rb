cask "macontent10-assetpack-0686-exs-worldguzheng" do
  version "60a733324fe1eaff576cd81946018817-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0686_EXS_WorldGuzheng.pkg"
  name "MAContent10_AssetPack_0686_EXS_WorldGuzheng"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0686_EXS_WorldGuzheng.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0686_EXS_WorldGuzheng.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0686_EXS_WorldGuzheng"
end
