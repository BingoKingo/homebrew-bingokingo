cask "2z695-0104-pop-piano-2-inversions-and-broken-chords" do
  version "3608ddf31557956a54640b70a3d7c97e-82"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0104_Pop%20Piano%202_Inversions%20and%20Broken%20Chords.pkg"
  name "2Z695-0104_Pop Piano 2_Inversions and Broken Chords"
  desc "Inversions and Broken Chords"
  homepage "https://audiocontentdownload.apple.com/ltp/en/poppiano.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0104_Pop%20Piano%202_Inversions%20and%20Broken%20Chords.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0104_Pop Piano 2_Inversions and Broken Chords.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0104_Pop Piano 2_Inversions and Broken Chords"
end
