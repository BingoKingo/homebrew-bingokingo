cask "2z695-0091-blues-guitar-1-12-bar-blues-in-a" do
  version "e1914b3d787515dc506d33d742c4ded8-66"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0091_Blues%20Guitar%201_12%20Bar%20Blues%20in%20A.pkg"
  name "2Z695-0091_Blues Guitar 1_12 Bar Blues in A"
  desc "12 bar blues progression in A, open dominant 7th chords, basic blues strumming p"
  homepage "https://audiocontentdownload.apple.com/ltp/en/bluesguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0091_Blues%20Guitar%201_12%20Bar%20Blues%20in%20A.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0091_Blues Guitar 1_12 Bar Blues in A.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0091_Blues Guitar 1_12 Bar Blues in A"
end
