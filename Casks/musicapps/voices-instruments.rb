cask "voices-instruments" do
  version "dc36918c101e83054a537298e7b2dde3-30"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/Voices_Instruments.pkg"
  name "JamPackVoicesInstrumentsPackage"
  desc "ContainsGarageBandLegacyInstruments, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/Voices_Instruments.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "Voices_Instruments.pkg"

  uninstall pkgutil: "com.apple.pkg.Voices_Instruments"
end
