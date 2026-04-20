cask "worldmusic-instruments" do
  version "e58e002aceda97de614cacd757bfab40-14"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/WorldMusic_Instruments.pkg"
  name "JamPackWorldMusicInstrumentsPackage"
  desc "ContainsGarageBandLegacyInstruments, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/WorldMusic_Instruments.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "WorldMusic_Instruments.pkg"

  uninstall pkgutil: "com.apple.pkg.WorldMusic_Instruments"
end
