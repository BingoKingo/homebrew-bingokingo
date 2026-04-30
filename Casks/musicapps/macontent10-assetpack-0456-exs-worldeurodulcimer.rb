cask "macontent10-assetpack-0456-exs-worldeurodulcimer" do
  version "83e1d722dd9f1385b58bf9f11734aa29-15"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0456_EXS_WorldEuroDulcimer.pkg"
  name "MAContent10_AssetPack_0456_EXS_WorldEuroDulcimer"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0456_EXS_WorldEuroDulcimer.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0456_EXS_WorldEuroDulcimer.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0456_EXS_WorldEuroDulcimer"
end
