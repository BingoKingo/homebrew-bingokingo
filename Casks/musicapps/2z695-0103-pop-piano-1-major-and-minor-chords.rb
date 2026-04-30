cask "2z695-0103-pop-piano-1-major-and-minor-chords" do
  version "345148c689de8d434eafaa486ed867e0-88"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0103_Pop%20Piano%201_Major%20and%20Minor%20Chords.pkg"
  name "2Z695-0103_Pop Piano 1_Major and Minor Chords"
  desc "Major and minor chords, five-finger patterns, left-hand roots, lead sheet readin"
  homepage "https://audiocontentdownload.apple.com/ltp/en/poppiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0103_Pop%20Piano%201_Major%20and%20Minor%20Chords.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0103_Pop Piano 1_Major and Minor Chords.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0103_Pop Piano 1_Major and Minor Chords"
end
