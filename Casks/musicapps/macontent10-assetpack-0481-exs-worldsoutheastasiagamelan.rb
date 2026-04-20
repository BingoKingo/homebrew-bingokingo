cask "macontent10-assetpack-0481-exs-worldsoutheastasiagamelan" do
  version "8d58eeae7b7827370db7ac1434bcda79-16"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0481_EXS_WorldSouthEastAsiaGamelan.pkg"
  name "MAContent10_AssetPack_0481_EXS_WorldSouthEastAsiaGamelan"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0481_EXS_WorldSouthEastAsiaGamelan.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0481_EXS_WorldSouthEastAsiaGamelan.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0481_EXS_WorldSouthEastAsiaGamelan"
end
