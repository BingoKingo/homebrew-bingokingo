cask "2z695-0092-blues-guitar-2-minor-pentatonic-scale" do
  version "40bec17c59f7b27b410a37f08a5836af-96"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0092_Blues%20Guitar%202_Minor%20Pentatonic%20Scale.pkg"
  name "2Z695-0092_Blues Guitar 2_Minor Pentatonic Scale"
  desc "Minor Pentatonic Scale"
  homepage "https://audiocontentdownload.apple.com/ltp/en/bluesguitar.html"

  livecheck do
    url "https://audiocontentdownload.apple.com/ltp/downloads/_/2Z695-0092_Blues%20Guitar%202_Minor%20Pentatonic%20Scale.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "2Z695-0092_Blues Guitar 2_Minor Pentatonic Scale.pkg"

  uninstall pkgutil: "com.apple.pkg.2Z695-0092_Blues Guitar 2_Minor Pentatonic Scale"
end
