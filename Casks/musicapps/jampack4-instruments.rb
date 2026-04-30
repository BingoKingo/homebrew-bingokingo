cask "jampack4-instruments" do
  version "ad00270a7df8a4b8f8e5c53407da2bcb-53"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/JamPack4_Instruments.pkg"
  name "JamPackSymphonyOrchestraInstrumentsPackage"
  desc "ContainsGarageBandLegacyInstruments, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/JamPack4_Instruments.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "JamPack4_Instruments.pkg"

  uninstall pkgutil: "com.apple.pkg.JamPack4_Instruments"
end
