cask "garagebandbasiccontent" do
  version "c8ab8f95e4a8964bf13403d79e24c0a9-188"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/GarageBandBasicContent.pkg"
  name "GarageBand11BaseContentPackage"
  desc "ContainsAppleLoops, ContainsGarageBandLegacyInstruments, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/GarageBandBasicContent.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "GarageBandBasicContent.pkg"

  uninstall pkgutil: "com.apple.pkg.GarageBandBasicContent"
end
