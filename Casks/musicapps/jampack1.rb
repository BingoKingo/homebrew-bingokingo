cask "jampack1" do
  version "5b237f9f945d4275ab4415a127f967de-31"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/JamPack1.pkg"
  name "JamPack1InstrumentsPackage"
  desc "ContainsGarageBandLegacyInstruments, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/JamPack1.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "JamPack1.pkg"

  uninstall pkgutil: "com.apple.pkg.JamPack1"
end
