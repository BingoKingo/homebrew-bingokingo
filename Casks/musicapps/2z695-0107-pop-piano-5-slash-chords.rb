cask "2z695-0107-pop-piano-5-slash-chords" do
  version "49ae34b593f286d2bb6c9b698577c7fc-58"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0107_Pop%20Piano%205_Slash%20Chords.pkg"
  name "2Z695-0107_Pop Piano 5_Slash Chords"
  desc "Slash Chords"
  homepage "https://audiocontentdownload.apple.com/ltp/en/poppiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0107_Pop%20Piano%205_Slash%20Chords.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0107_Pop Piano 5_Slash Chords.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0107_Pop Piano 5_Slash Chords"
end
