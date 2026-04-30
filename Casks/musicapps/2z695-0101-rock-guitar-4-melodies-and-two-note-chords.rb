cask "2z695-0101-rock-guitar-4-melodies-and-two-note-chords" do
  version "549274e6501555dd12216ea7a3583b86-72"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0101_Rock%20Guitar%204_Melodies%20and%20Two%20Note%20Chords.pkg"
  name "2Z695-0101_Rock Guitar 4_Melodies and Two Note Chords"
  desc "Melodies and Two-note Chords"
  homepage "https://audiocontentdownload.apple.com/ltp/en/rockguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0101_Rock%20Guitar%204_Melodies%20and%20Two%20Note%20Chords.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0101_Rock Guitar 4_Melodies and Two Note Chords.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0101_Rock Guitar 4_Melodies and Two Note Chords"
end
