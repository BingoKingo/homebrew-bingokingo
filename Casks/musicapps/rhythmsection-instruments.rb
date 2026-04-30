cask "rhythmsection-instruments" do
  version "4995ce28d7dd28cd09502b9cadb934b9-157"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/RhythmSection_Instruments.pkg"
  name "JamPackRhythmSectionInstrumentsPackage"
  desc "ContainsGarageBandLegacyInstruments, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/RhythmSection_Instruments.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "RhythmSection_Instruments.pkg"

  uninstall pkgutil: "com.apple.pkg.RhythmSection_Instruments"
end
