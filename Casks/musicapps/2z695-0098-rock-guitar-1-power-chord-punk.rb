cask "2z695-0098-rock-guitar-1-power-chord-punk" do
  version "7ea3aa768c66f6e1b9e8a5829947af13-67"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0098_Rock%20Guitar%201_Power%20Chord%20Punk.pkg"
  name "2Z695-0098_Rock Guitar 1_Power Chord Punk"
  desc "6th, 5th and 4th string power chords, palm muting, accents, fast downstroke stru"
  homepage "https://audiocontentdownload.apple.com/ltp/en/rockguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0098_Rock%20Guitar%201_Power%20Chord%20Punk.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0098_Rock Guitar 1_Power Chord Punk.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0098_Rock Guitar 1_Power Chord Punk"
end
