cask "2z695-0050-guitar-lesson-2-chords-g-and-c" do
  version "d2a4201a2391e4a05df6bdf8498dffe2-32"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0050_Guitar%20Lesson%202_Chords%20-%20G%20and%20C.pkg"
  name "2Z695-0050_Guitar Lesson 2_Chords - G and C"
  desc "Reading chord diagrams, open G and C chords, basic strumming patterns and chord"
  homepage "https://audiocontentdownload.apple.com/ltp/en/basicguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0050_Guitar%20Lesson%202_Chords%20-%20G%20and%20C.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0050_Guitar Lesson 2_Chords - G and C.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0050_Guitar Lesson 2_Chords - G and C"
end
