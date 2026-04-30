cask "remixtools-instruments" do
  version "720b5bf1ac94ffafac62a1e41a89ec7c-61"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/RemixTools_Instruments.pkg"
  name "JamPackRemixToolsInstrumentsPackage"
  desc "ContainsGarageBandLegacyInstruments, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/RemixTools_Instruments.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "RemixTools_Instruments.pkg"

  uninstall pkgutil: "com.apple.pkg.RemixTools_Instruments"
end
