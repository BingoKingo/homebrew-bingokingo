cask "2z695-0105-pop-piano-3-suspended-chords" do
  version "f98447a29de44ba28e8175b5f58df0e5-76"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0105_Pop%20Piano%203_Suspended%20Chords.pkg"
  name "2Z695-0105_Pop Piano 3_Suspended Chords"
  desc "Suspended Chords"
  homepage "https://audiocontentdownload.apple.com/ltp/en/poppiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0105_Pop%20Piano%203_Suspended%20Chords.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0105_Pop Piano 3_Suspended Chords.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0105_Pop Piano 3_Suspended Chords"
end
