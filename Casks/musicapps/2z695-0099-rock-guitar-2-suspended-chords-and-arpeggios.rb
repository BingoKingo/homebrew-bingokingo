cask "2z695-0099-rock-guitar-2-suspended-chords-and-arpeggios" do
  version "ac768ca7bc1aa951296b49bd6787770e-78"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0099_Rock%20Guitar%202_Suspended%20Chords%20and%20Arpeggios.pkg"
  name "2Z695-0099_Rock Guitar 2_Suspended Chords and Arpeggios"
  desc "Suspended Chords and Arpeggios"
  homepage "https://audiocontentdownload.apple.com/ltp/en/rockguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0099_Rock%20Guitar%202_Suspended%20Chords%20and%20Arpeggios.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0099_Rock Guitar 2_Suspended Chords and Arpeggios.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0099_Rock Guitar 2_Suspended Chords and Arpeggios"
end
