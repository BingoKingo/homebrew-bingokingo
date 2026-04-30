cask "macontent10-assetpack-0467-exs-worldeurobalalaika" do
  version "f6dd1559d09a854cb88ced5e8fd60f3a-13"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0467_EXS_WorldEuroBalalaika.pkg"
  name "MAContent10_AssetPack_0467_EXS_WorldEuroBalalaika"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0467_EXS_WorldEuroBalalaika.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0467_EXS_WorldEuroBalalaika.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0467_EXS_WorldEuroBalalaika"
end
