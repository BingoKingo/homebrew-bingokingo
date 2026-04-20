cask "2z695-0106-pop-piano-4-7th-chords" do
  version "c621bf5af227a2e1ffb6e39df0dcbb5a-66"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0106_Pop%20Piano%204_7th%20Chords.pkg"
  name "2Z695-0106_Pop Piano 4_7th Chords"
  desc "7th Chords"
  homepage "https://audiocontentdownload.apple.com/ltp/en/poppiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0106_Pop%20Piano%204_7th%20Chords.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0106_Pop Piano 4_7th Chords.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0106_Pop Piano 4_7th Chords"
end
