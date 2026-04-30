cask "macontent10-assetpack-0493-exs-orchperccrotales" do
  version "a3884093d1c478dbaee8123fc80bef13-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0493_EXS_OrchPercCrotales.pkg"
  name "MAContent10_AssetPack_0493_EXS_OrchPercCrotales"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0493_EXS_OrchPercCrotales.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0493_EXS_OrchPercCrotales.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0493_EXS_OrchPercCrotales"
end
