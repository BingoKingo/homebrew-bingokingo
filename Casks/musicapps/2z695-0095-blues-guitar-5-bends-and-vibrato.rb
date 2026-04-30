cask "2z695-0095-blues-guitar-5-bends-and-vibrato" do
  version "3a28d3e5e5cde373eeeaaa2590d7f88c-127"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0095_Blues%20Guitar%205_Bends%20and%20Vibrato.pkg"
  name "2Z695-0095_Blues Guitar 5_Bends and Vibrato"
  desc "Bends and Vibrato"
  homepage "https://audiocontentdownload.apple.com/ltp/en/bluesguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0095_Blues%20Guitar%205_Bends%20and%20Vibrato.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0095_Blues Guitar 5_Bends and Vibrato.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0095_Blues Guitar 5_Bends and Vibrato"
end
